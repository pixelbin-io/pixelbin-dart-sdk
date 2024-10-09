import '../transformation_data.dart';

class PwrRemove {
  /// Method for PDF Watermark Removal Plugin
  /// Returns [TransformationData].
  TransformationData remove() {
    var values = <String, String>{};
    return TransformationData(plugin: 'pwr', name: 'remove', values: values);
  }
}
