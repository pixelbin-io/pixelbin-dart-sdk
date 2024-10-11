import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pixelbin/_pixelbin.dart';
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
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _callPixelBinUpload() async {
    try {
      final fields = {
        // Key:    Value
        "x-pixb-meta-assetdata":
            "{\"orgId\":5814399,\"type\":\"file\",\"name\":\"filename.jpeg\",\"path\":\"path/to/containing/folder\",\"fileId\":\"path/to/containing/folder/filename.jpeg\",\"format\":\"jpeg\",\"s3Bucket\":\"erase-erase-erasebg-assets\",\"s3Key\":\"uploads/vijay-744d3d/original/71ea75a1-eeb6-41ce-b5a1-093d248dddf9.jpeg\",\"access\":\"public-read\",\"tags\":[\"tag1\",\"tag2\"],\"metadata\":{\"source\":\"signedUrl\",\"publicUploadId\":\"2a2994a1-75ec-42b9-b67f-34a96c514890\"},\"overwrite\":false,\"filenameOverride\":true}"
      };
      final signedDetails = SignedDetails(
          url:
              "https://api.pixelbin.io/service/public/assets/v1.0/signed-multipart?pbs=528b02165e18eb713e24137a48b0d2c6f12971139f730166cc407dc386abde26&pbe=1718884967679&pbt=9310166e-34b1-43a7-93a8-e659c371230f&pbo=5814399&pbu=2a2994a1-75ec-42b9-b67f-34a96c514890",
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

      final eraseTransformation = Transformation.eraseBg();
      final resizeTransformation = Transformation.tResize(width: 200);
      final blurTransformation = Transformation.tBlur(dpr: 5);

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
        title: const Text('Image Picker Example'),
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
