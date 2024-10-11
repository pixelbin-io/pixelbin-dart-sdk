import '../transformation_data.dart';

class BgExtend {
  /// Method for AI Image Extender
  /// - [boundingBox] : Bounding Box (Default: )
  /// - [prompt] : Prompt (Default: )
  /// - [negativePrompt] : Negative Prompt (Default: )
  /// - [strength] : Strength (Default: 0.999)
  /// - [guidanceScale] : Guidance Scale (Default: 8)
  /// - [numberOfInferenceSteps] : Number of inference steps (Default: 10)
  /// - [colorAdjust] : Color Adjust (Default: false)
  /// - [seed] : seed (Default: 123)
  /// Returns [TransformationData].
  TransformationData extend(
    String? boundingBox,
    String? prompt,
    String? negativePrompt,
    double? strength,
    int? guidanceScale,
    int? numberOfInferenceSteps,
    bool? colorAdjust,
    int? seed,
  ) {
    var values = <String, String>{};
    if (boundingBox != null) {
      values['bbox'] = boundingBox.toString();
    }
    if (prompt != null) {
      values['p'] = prompt.toString();
    }
    if (negativePrompt != null) {
      values['np'] = negativePrompt.toString();
    }
    if (strength != null) {
      values['s'] = strength.toString();
    }
    if (guidanceScale != null) {
      values['gs'] = guidanceScale.toString();
    }
    if (numberOfInferenceSteps != null) {
      values['nis'] = numberOfInferenceSteps.toString();
    }
    if (colorAdjust != null) {
      values['ca'] = colorAdjust.toString();
    }
    if (seed != null) {
      values['sd'] = seed.toString();
    }
    return TransformationData(plugin: 'bg', name: 'extend', values: values);
  }
}
