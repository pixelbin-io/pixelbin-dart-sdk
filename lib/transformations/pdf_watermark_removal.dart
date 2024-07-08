import '../transformation_data.dart';

class PdfWatermarkRemoval {
  /// Method for PDF Watermark Removal Plugin
  ///
  /// @return TransformationData.
  TransformationData remove() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'pwr', name: 'remove', values: values);
  }
}
