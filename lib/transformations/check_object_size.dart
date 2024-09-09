import '../transformation_data.dart';

class CosDetect {
  /// Method for Calculates the percentage of the main object area relative to image dimensions.
  ///
  ///
  /// - [objectThresholdPercent] : Object Threshold Percent (Default: 50)
  ///
  ///
  /// Returns [TransformationData].
  TransformationData detect(
    int? objectThresholdPercent,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (objectThresholdPercent != null) {
      values['obj_threshold_perc'] = objectThresholdPercent.toString();
    }

    return TransformationData(plugin: 'cos', name: 'detect', values: values);
  }
}
