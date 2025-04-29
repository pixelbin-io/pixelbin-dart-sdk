import '../transformation_data.dart';

class BgExtend {
  /// Method for AI Image Extender

  /// - [boundingBox] : Bounding Box (Default: )

  /// - [prompt] : Prompt (Default: )

  /// - [guidanceScale] : Guidance Scale (Default: 30)

  /// - [numberOfInferenceSteps] : Number of inference steps (Default: 50)

  /// - [seed] : seed (Default: 123)

  /// Returns [TransformationData].
  TransformationData extend(
    String? boundingBox,
    String? prompt,
    int? guidanceScale,
    int? numberOfInferenceSteps,
    int? seed,
  ) {
    var values = <String, String>{};

    if (boundingBox != null) {
      values['bbox'] = boundingBox.toString();
    }

    if (prompt != null) {
      values['p'] = prompt.toString();
    }

    if (guidanceScale != null) {
      values['gs'] = guidanceScale.toString();
    }

    if (numberOfInferenceSteps != null) {
      values['nis'] = numberOfInferenceSteps.toString();
    }

    if (seed != null) {
      values['sd'] = seed.toString();
    }

    return TransformationData(plugin: 'bg', name: 'extend', values: values);
  }
}
