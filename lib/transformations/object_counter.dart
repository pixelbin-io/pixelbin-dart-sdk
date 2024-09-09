import '../transformation_data.dart';

class OcDetect {
  /// Method for Classifies whether objects in the image are single or multiple
  ///
  /// Returns [TransformationData].
  TransformationData detect() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'oc', name: 'detect', values: values);
  }
}
