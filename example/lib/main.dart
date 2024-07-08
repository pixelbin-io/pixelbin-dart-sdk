import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pixelbin/pixelbin.dart';
import 'package:pixelbin/pixelbin_image.dart';
import 'package:pixelbin/transformation.dart';
import 'package:pixelbin/upload.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ImagePickerWidget(),
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  ImagePickerWidgetState createState() => ImagePickerWidgetState();
}

class ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile = File('picked image file path');
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  Future<void> _callPixelBinUpload() async {
    debugPrint("Filepath:=> ${_imageFile?.path}");

    try {
      final fields = {
        // Key:    Value
        "key": "meta data value"
      };
      final signedDetails = SignedDetails(
          url: "signed image url",
          fields: fields);
      final PixelBinImage? uploadResponse = await PixelBin.shared
          .upload(file: _imageFile!, signedDetails: signedDetails);
      debugPrint("Response:=> ${uploadResponse?.encoded}");
    } catch (e) {
      debugPrint("Error:=> ${e.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();

    var pixelBin = PixelBin.shared;

    final PixelBinImage? imageFromUrl = pixelBin.imageFromUrl(
        "https://cdn.pixelbin.io/v2/dummy-cloudname/erase.bg(shadow:false,r:true,i:general)~af.remove()~t.blur(s:0.3,dpr:1.0)/__playground/playground-default.jpeg");

    debugPrint(imageFromUrl?.encoded);

    if (imageFromUrl != null) {
      final PixelBinImage imageFromDetails = pixelBin.image(
          imagePath: imageFromUrl.imagePath,
          cloud: imageFromUrl.cloudName,
          transformations: imageFromUrl.transformations,
          version: imageFromUrl.version);
      debugPrint(imageFromDetails.encoded);

      // final image = PixelBin.shared.image(imagePath: "example/logo/apple.jpg", cloud: "apple_cloud", zone: "south_asia");
      // debugPrint(imageFromDetails.encoded); // https://cdn.pixelbin.io/v2/apple_cloud/south_asia/original/example/logo/apple.jpg

      final eraseTransformation = Transformation.erasebg();
      final resizeTransformation = Transformation.resize(width: 200);
      final blurTransformation = Transformation.blur(dpr: 5);

      // imageFromDetails.addTransformations([eraseTransformation, resizeTransformation]);
      //OR
      imageFromDetails.addTransformation(eraseTransformation);
      imageFromDetails.addTransformation(resizeTransformation);
      imageFromDetails.addTransformation(blurTransformation);

      final outputUrl = imageFromDetails.encoded;
      debugPrint("imageDetails:=> output:->$outputUrl");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PixelBin SDK Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageFile != null
                ? Image.file(
                    _imageFile!,
                    height: 300,
                    width: 300,
                  )
                : Container(
                    height: 300,
                    width: 300,
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.image,
                      size: 100,
                      color: Colors.grey[700],
                    ),
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image from Gallery'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _callPixelBinUpload,
              child: const Text('Upload File'),
            ),
          ],
        ),
      ),
    );
  }
}
