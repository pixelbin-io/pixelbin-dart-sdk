import '../transformation_data.dart';

class ImageCentering {
  /// Method for Image Centering Module
  ///
  /// - [distancepercentage] : Distance percentage (Default: 10)
  ///
  /// Returns [TransformationData].
  TransformationData detect(
    int? distancepercentage,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (distancepercentage != null) {
      values['dist_perc'] = distancepercentage.toString();
    }

    return TransformationData(plugin: 'imc', name: 'detect', values: values);
  }
}
