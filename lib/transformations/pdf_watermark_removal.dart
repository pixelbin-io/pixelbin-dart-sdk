import '../transformation_data.dart';

class PwrRemove {
  /// Method for PDF Watermark Removal Plugin
  ///
  /// Returns [TransformationData].
  TransformationData remove() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'pwr', name: 'remove', values: values);
  }
}
