import '../transformation_data.dart';

class NumberPlateDetection {
  /// Method for Number Plate Detection Plugin
  /// @return TransformationData.
  TransformationData detect() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(
        plugin: 'numPlate', name: 'detect', values: values);
  }
}
