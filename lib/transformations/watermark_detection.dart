import '../transformation_data.dart';

class WmcDetect {
  /// Method for Watermark Detection Plugin
  ///
  ///
  /// - [detectText] : Detect Text (Default: false)
  ///
  ///
  /// Returns [TransformationData].
  TransformationData detect(
    bool? detectText,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (detectText != null) {
      values['detect_text'] = detectText.toString();
    }

    return TransformationData(plugin: 'wmc', name: 'detect', values: values);
  }
}
