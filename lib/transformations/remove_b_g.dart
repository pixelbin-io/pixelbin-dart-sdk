import '../transformation_data.dart';

class RemoveBG {
  /// Method for Remove background from any image
  /// @return TransformationData.
  TransformationData bg() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'remove', name: 'bg', values: values);
  }
}
