import '../transformation_data.dart';

class CheckObjectSize {
  /// Method for Calculates the percentage of the main object area relative to image dimensions.
  ///
  /// @param Object Threshold Percent int (Default: 50)
  ///
  /// @return TransformationData.
  TransformationData detect(
    int? objectthresholdpercent,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (objectthresholdpercent != null) {
      values['obj_threshold_perc'] = objectthresholdpercent.toString();
    }

    return TransformationData(plugin: 'cos', name: 'detect', values: values);
  }
}
