import '../transformation_data.dart';

class WmvRemove {
  /// Method for Video Watermark Removal Plugin
  /// Returns [TransformationData].
  TransformationData remove() {
    var values = <String, String>{};
    return TransformationData(plugin: 'wmv', name: 'remove', values: values);
  }
}
