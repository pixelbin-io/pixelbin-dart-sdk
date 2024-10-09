import '../transformation_data.dart';

class AfRemove {
  /// Method for Artifact Removal Plugin
  /// Returns [TransformationData].
  TransformationData remove() {
    var values = <String, String>{};
    return TransformationData(plugin: 'af', name: 'remove', values: values);
  }
}
