import '../transformation_data.dart';

class OdDetect {
  /// Method for Detect bounding boxes of objects in the image
  ///
  /// Returns [TransformationData].
  TransformationData detect() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'od', name: 'detect', values: values);
  }
}
