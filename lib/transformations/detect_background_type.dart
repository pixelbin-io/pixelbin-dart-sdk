import '../transformation_data.dart';

class DetectBackgroundType {
  /// Method for Classifies the background of a product as plain, clean or busy
  ///
  /// @return TransformationData.
  TransformationData detect() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'dbt', name: 'detect', values: values);
  }
}
