import '../transformation_data.dart';

class CpvDetect {
  /// Method for Classifies whether the product in the image is completely visible or not
  /// Returns [TransformationData].
  TransformationData detect() {
    var values = <String, String>{};
    return TransformationData(plugin: 'cpv', name: 'detect', values: values);
  }
}
