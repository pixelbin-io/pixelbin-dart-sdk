import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:pixelbin/pixelbin_dart_sdk.dart';

import 'async.dart';

class SignedDetails {
  final String url;
  final Map<String, String> fields;

  SignedDetails({required this.url, required this.fields});

  // Manual serialization to Map
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'fields': fields,
    };
  }

  // Manual deserialization from Map
  factory SignedDetails.fromJson(Map<String, dynamic> json) {
    return SignedDetails(
      url: json['url'] as String,
      fields: Map<String, String>.from(json['fields']),
    );
  }
}

Future<int> getFileSize(String filePath) async {
  try {
    final file = File(filePath);
    return await file.length();
  } catch (e) {
    return 0;
  }
}

class Uploader {
  Future<PixelBinImage?> upload(File file, SignedDetails signedDetails,
      {int chunkSize = 1024, int concurrency = 1}) async {
    if (signedDetails.url.contains("storage.googleapis.com")) {
      return await uploadToGCS(
        signedDetails.url,
        signedDetails.fields,
        file,
      );
    } else if (signedDetails.url.contains("api.pixelbin")) {
      return await multipartFileUpload(file, signedDetails, chunkSize, concurrency);
    } else {
      return await uploadToS3(
        signedDetails.url,
        signedDetails.fields,
        file,
      );
    }
  }

  Future<PixelBinImage?> uploadToS3(
      String url, Map<String, String> fields, File file) async {
    var uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri);

    fields.forEach((key, value) {
      request.fields[key] = value;
    });

    var stream = http.ByteStream(file.openRead());
    var length = await file.length();
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: path.basename(file.path));
    request.files.add(multipartFile);

    var response = await request.send();
    if (response.statusCode != 200) {
      throw Exception('Failed to upload to S3');
    }
    return null;
  }

  Future<PixelBinImage?> uploadToGCS(
      String url, Map<String, String> fields, File file) async {
    var uri = Uri.parse(url);
    var request = http.Request('PUT', uri);

    fields.forEach((key, value) {
      request.headers[key] = value;
    });

    request.bodyBytes = await file.readAsBytes();
    var response = await request.send();
    if (response.statusCode != 200) {
      throw Exception('Failed to upload to GCS');
    }
    return null;
  }

  Future<PixelBinImage?> multipartFileUpload(File file,
      SignedDetails signedDetails, int chunkSize, int concurrency) async {
    final fileSize = await file.length();
    final chunkSizeInBytes = 1024 * chunkSize;
    final semaphore = Semaphore(concurrency, onEachCompleted: (int milliseconds) {
      print('Chunk uploaded in $milliseconds ms');
    });

    var partNumber = 0;
    var offset = 0;
    var errorOccurred = false;
    var parts = <int>[];

    List<Future<void>> uploadFutures = [];

    while (offset < fileSize && !errorOccurred) {
      final end = (offset + chunkSizeInBytes).clamp(0, fileSize);
      final chunk = await readChunk(file, offset, end - offset);

      partNumber++;
      final url = '${signedDetails.url}&partNumber=$partNumber';
      final request = http.MultipartRequest('PUT', Uri.parse(url));

      signedDetails.fields.forEach((key, value) {
        request.fields[key] = value;
      });

      request.files.add(
          http.MultipartFile.fromBytes('file', chunk, filename: 'chunk'));

      final client = http.Client();

      uploadFutures.add(semaphore.withPermit(() async {
        final response = await client.send(request);
        final responseBody = await response.stream.bytesToString();
        print("Response: ${response.statusCode} $responseBody");
        if (response.statusCode >= 200 && response.statusCode < 300) {
          parts.add(partNumber);
        } else {
          errorOccurred = true;
          throw Exception(
              "Request Error: ${response.statusCode} $responseBody");
        }
      }));

      offset = end;
    }

    await Future.wait(uploadFutures);

    if (!errorOccurred) {
      return completeMultipartUpload(
          signedDetails.url, signedDetails.fields, partNumber);
    }
    throw Exception("Unknown Error occurred");
  }

  Future<List<int>> readChunk(File file, int startOffset, int length) async {
    final raf = await file.open();
    await raf.setPosition(startOffset);
    final chunk = await raf.read(length);
    await raf.close();
    return chunk;
  }

  Future<PixelBinImage?> completeMultipartUpload(
      String? url, Map<String, String> fields, int partNumber) async {
    if (url == null) {
      throw Exception("Invalid url: $url");
    }

    final body = {
      ...fields,
      'parts': List.generate(partNumber, (index) => index + 1)
    };

    final request = http.Request('POST', Uri.parse(url))
      ..headers['Content-Type'] = 'application/json'
      ..body = jsonEncode(body);

    final client = http.Client();
    final response = await client.send(request);
    final responseBody = await response.stream.bytesToString();
    print("Response: ${response.statusCode} $responseBody");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final data = jsonDecode(responseBody) as Map<String, dynamic>;
        final image = PixelBinImage.fromUrl(data["url"]);
        return image;
      } catch (e) {
        throw Exception(
            "Data can not parsed, but Image is uploaded successfully");
      }
    } else {
      throw Exception("Request Error: ${response.statusCode} $responseBody");
    }
  }
}
