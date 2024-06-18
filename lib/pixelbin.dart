import 'dart:io';
import 'package:pixelbin/pixelbin_image.dart';
import 'package:pixelbin/transformation_data.dart';
import 'package:pixelbin/upload.dart';

class PixelBin {
  static final PixelBin shared = PixelBin._internal();

  PixelBin._internal();

  PixelBinImage image({
    required String imagePath,
    required String cloud,
    String? zone,
    bool worker = false,
    List<TransformationData> transformations = const [],
    String host = "cdn.pixelbin.io",
    String version = "v2",
  }) {
    return PixelBinImage(
      imagePath: imagePath,
      cloudName: cloud,
      zone: zone,
      worker: worker,
      transformations: transformations,
      host: host,
      version: version,
    );
  }

  PixelBinImage? imageFromUrl(String url) {
    try {
      return PixelBinImage.fromUrl(url);
    } catch (e) {
      print("Error parsing URL: $e");
      return null;
    }
  }

  Future<PixelBinImage?> upload({
    required File file,
    required SignedDetails signedDetails,
    int chunkSize = 1024,
    int concurrency = 1,
  }) async {
    var uploader = Uploader();
    return uploader.upload(file, signedDetails,
        chunkSize: chunkSize, concurrency: concurrency);
  }
}
