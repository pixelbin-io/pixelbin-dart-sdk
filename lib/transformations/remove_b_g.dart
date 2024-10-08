import '../transformation_data.dart';

class RemoveBg {
  /// Method for Remove background from any image
  ///
  /// Returns [TransformationData].
  TransformationData bg() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'remove', name: 'bg', values: values);
  }
}
