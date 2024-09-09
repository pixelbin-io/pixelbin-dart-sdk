import '../transformation_data.dart';

class DbtDetect {
  /// Method for Classifies the background of a product as plain, clean or busy
  ///
  /// Returns [TransformationData].
  TransformationData detect() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'dbt', name: 'detect', values: values);
  }
}
