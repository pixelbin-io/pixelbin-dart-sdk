import '../transformation_data.dart';

class DbtDetect {
  /// Method for Classifies the background of a product as plain, clean or busy
  /// Returns [TransformationData].
  TransformationData detect() {
    var values = <String, String>{};
    return TransformationData(plugin: 'dbt', name: 'detect', values: values);
  }
}
