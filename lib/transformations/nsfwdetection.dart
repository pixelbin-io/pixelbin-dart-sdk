import '../transformation_data.dart';

class NsfwDetect {
  /// Method for Detect NSFW content in images
  /// - [minimumConfidence] : Minimum Confidence (Default: 0.5)
  /// Returns [TransformationData].
  TransformationData detect(
    double? minimumConfidence,
  ) {
    var values = <String, String>{};
    if (minimumConfidence != null) {
      values['m'] = minimumConfidence.toString();
    }
    return TransformationData(plugin: 'nsfw', name: 'detect', values: values);
  }
}
