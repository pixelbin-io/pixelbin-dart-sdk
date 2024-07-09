import '../transformation_data.dart';

class CheckProductVisibility {
  /// Method for Classifies whether the product in the image is completely visible or not
  ///
  /// Returns [TransformationData].
  TransformationData detect() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'cpv', name: 'detect', values: values);
  }
}
