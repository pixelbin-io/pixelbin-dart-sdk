import '../transformation_data.dart';

class ProductTagging {
  /// Method for AI Product Tagging
  ///
  /// Returns [TransformationData].
  TransformationData tag() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'pr', name: 'tag', values: values);
  }
}
