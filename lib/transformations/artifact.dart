import '../transformation_data.dart';

class AfRemove {
  /// Method for Artifact Removal Plugin
  ///
  /// Returns [TransformationData].
  TransformationData remove() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'af', name: 'remove', values: values);
  }
}
