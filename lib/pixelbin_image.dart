import 'package:pixelbin/transformation_data.dart';

class PixelBinImage {
  final String imagePath;
  final String cloudName;
  final String? zone;
  final List<TransformationData> transformations;
  final String host;
  final String version;
  final bool worker;

  PixelBinImage({
    required this.imagePath,
    required this.cloudName,
    this.zone,
    this.worker = false,
    List<TransformationData>? transformations,
    this.host = "cdn.pixelbin.io",
    this.version = "v2",
  }) : transformations = transformations ?? [];

  static PixelBinImage? fromUrl(String urlString) {
    try {
      final url = Uri.parse(urlString);
      final components = url.pathSegments.where((c) => c.isNotEmpty).toList();
      if (components.length < 3) throw Exception("Invalid pixelbin url");

      final host = url.host;
      final version = components[0];
      final cloud = components[1];
      String? zone;
      String imagePath;
      List<TransformationData> transformation = [];
      bool worker = false;

      if (components[2] == "wrkr" ||
          components[2] == "original" ||
          components[2].hasTransformation()) {
        zone = null;
        imagePath = components.skip(3).join("/");
        worker = components[2] == "wrkr";
        transformation = components[2].hasTransformation()
            ? components[2].decodeTransformationData()
            : [];
      } else if (components.length > 3 &&
          (components[3] == "wrkr" ||
              components[3] == "original" ||
              components[3].hasTransformation())) {
        zone = components[2];
        imagePath = components.skip(4).join("/");
        worker = components[3] == "wrkr";
        transformation = components[3].hasTransformation()
            ? components[3].decodeTransformationData()
            : [];
      } else {
        throw Exception("Invalid pixelbin url");
      }

      return PixelBinImage(
        imagePath: imagePath,
        cloudName: cloud,
        zone: zone,
        worker: worker,
        transformations: transformation,
        host: host,
        version: version,
      );
    } catch (e) {
      print("Error parsing URL: $e");
      return null;
    }
  }

  void addTransformation(TransformationData transformation) {
    transformations.add(transformation);
  }

  String get encoded {
    final operations = worker
        ? "wrkr"
        : (transformations.encode().replaceAll(" ", "").isEmpty
            ? "original"
            : transformations.encode().replaceAll(" ", ""));
    final zonePart = zone != null ? "$zone/" : "";
    return "https://$host/$version/$cloudName/$zonePart$operations/$imagePath";
  }
}
