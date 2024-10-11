import '../transformation_data.dart';

class GooglevisDetectlabels {
  /// Method for Detect content and text in images
  /// - [maximumLabels] : Maximum Labels (Default: 5)
  /// Returns [TransformationData].
  TransformationData detectLabels(
    int? maximumLabels,
  ) {
    var values = <String, String>{};
    if (maximumLabels != null) {
      values['l'] = maximumLabels.toString();
    }
    return TransformationData(
        plugin: 'googleVis', name: 'detectLabels', values: values);
  }
}
