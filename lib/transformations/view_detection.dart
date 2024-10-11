import '../transformation_data.dart';

class VdDetect {
  /// Method for Classifies wear type and view type of products in the image
  /// Returns [TransformationData].
  TransformationData detect() {
    var values = <String, String>{};
    return TransformationData(plugin: 'vd', name: 'detect', values: values);
  }
}
