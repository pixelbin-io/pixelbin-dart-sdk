import '../transformation_data.dart';

class ViewDetection {
  /// Method for Classifies wear type and view type of products in the image
  ///
  /// Returns [TransformationData].
  TransformationData detect() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'vd', name: 'detect', values: values);
  }
}
