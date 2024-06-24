import '../transformation_data.dart';

class TextDetectionandRecognition {
  /// Method for OCR Module
  /// @param Detect Only bool (Default: false)
  /// @return TransformationData.
  TransformationData extract(
    bool? detectonly,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (detectonly != null) {
      values['detect_only'] = detectonly.toString();
    }

    return TransformationData(plugin: 'ocr', name: 'extract', values: values);
  }
}
