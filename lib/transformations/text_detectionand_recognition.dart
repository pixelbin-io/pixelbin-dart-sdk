import '../transformation_data.dart';

class OcrExtract {
  /// Method for OCR Module
  /// - [detectOnly] : Detect Only (Default: false)
  /// Returns [TransformationData].
  TransformationData extract(
    bool? detectOnly,
  ) {
    var values = <String, String>{};
    if (detectOnly != null) {
      values['detect_only'] = detectOnly.toString();
    }
    return TransformationData(plugin: 'ocr', name: 'extract', values: values);
  }
}
