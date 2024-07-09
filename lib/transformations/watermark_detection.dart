import '../transformation_data.dart';

class WatermarkDetection {
  /// Method for Watermark Detection Plugin
  ///
  /// - [detecttext] : Detect Text (Default: false)
  ///
  /// Returns [TransformationData].
  TransformationData detect(
    bool? detecttext,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (detecttext != null) {
      values['detect_text'] = detecttext.toString();
    }

    return TransformationData(plugin: 'wmc', name: 'detect', values: values);
  }
}
