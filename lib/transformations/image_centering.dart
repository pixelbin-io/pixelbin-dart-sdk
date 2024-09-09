import '../transformation_data.dart';

class ImcDetect {
  /// Method for Image Centering Module
  ///
  ///
  /// - [distancePercentage] : Distance percentage (Default: 10)
  ///
  ///
  /// Returns [TransformationData].
  TransformationData detect(
    int? distancePercentage,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (distancePercentage != null) {
      values['dist_perc'] = distancePercentage.toString();
    }

    return TransformationData(plugin: 'imc', name: 'detect', values: values);
  }
}
