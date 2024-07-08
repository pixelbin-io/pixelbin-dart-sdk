import '../transformation_data.dart';

class NSFWDetection {
  /// Method for Detect NSFW content in images
  ///
  /// @param Minimum Confidence double (Default: 0.5)
  ///
  /// @return TransformationData.
  TransformationData detect(
    double? minpimumconfidence,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (minpimumconfidence != null) {
      values['m'] = minpimumconfidence.toString();
    }

    return TransformationData(plugin: 'nsfw', name: 'detect', values: values);
  }
}
