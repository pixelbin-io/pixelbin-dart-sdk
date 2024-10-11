import '../transformation_data.dart';

class OdDetect {
  /// Method for Detect bounding boxes of objects in the image
  /// Returns [TransformationData].
  TransformationData detect() {
    var values = <String, String>{};
    return TransformationData(plugin: 'od', name: 'detect', values: values);
  }
}
