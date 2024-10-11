import '../transformation_data.dart';

class PrTag {
  /// Method for AI Product Tagging
  /// Returns [TransformationData].
  TransformationData tag() {
    var values = <String, String>{};
    return TransformationData(plugin: 'pr', name: 'tag', values: values);
  }
}
