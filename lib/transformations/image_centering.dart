import '../transformation_data.dart';

class ImcDetect {
  /// Method for Image Centering Module
  /// - [distancePercentage] : Distance percentage (Default: 10)
  /// Returns [TransformationData].
  TransformationData detect(
    int? distancePercentage,
  ) {
    var values = <String, String>{};
    if (distancePercentage != null) {
      values['dist_perc'] = distancePercentage.toString();
    }
    return TransformationData(plugin: 'imc', name: 'detect', values: values);
  }
}
