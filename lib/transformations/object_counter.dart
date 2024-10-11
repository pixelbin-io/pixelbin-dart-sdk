import '../transformation_data.dart';

class OcDetect {
  /// Method for Classifies whether objects in the image are single or multiple
  /// Returns [TransformationData].
  TransformationData detect() {
    var values = <String, String>{};
    return TransformationData(plugin: 'oc', name: 'detect', values: values);
  }
}
