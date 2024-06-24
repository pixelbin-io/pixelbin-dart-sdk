import '../transformation_data.dart';

class ObjectCounter {
  /// Method for Classifies whether objects in the image are single or multiple
  /// @return TransformationData.
  TransformationData detect() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'oc', name: 'detect', values: values);
  }
}
