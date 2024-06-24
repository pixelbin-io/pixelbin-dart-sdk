import '../transformation_data.dart';

class GoogleVisionPlugin {
  /// Method for Detect content and text in images
  /// @param Maximum Labels int (Default: 5)
  /// @return TransformationData.
  TransformationData detectLabels(
    int? maximumlabels,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (maximumlabels != null) {
      values['l'] = maximumlabels.toString();
    }

    return TransformationData(
        plugin: 'googleVis', name: 'detectLabels', values: values);
  }
}
