import '../transformation_data.dart';

class NumplateDetect {
  /// Method for Number Plate Detection Plugin
  /// Returns [TransformationData].
  TransformationData detect() {
    var values = <String, String>{};
    return TransformationData(
        plugin: 'numPlate', name: 'detect', values: values);
  }
}
