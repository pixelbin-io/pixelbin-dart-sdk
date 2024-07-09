import '../transformation_data.dart';

class Detectlabels {
  /// Method for Detect objects and text in images
  ///
  /// - [maximumlabels] : Maximum Labels (Default: 5)
  ///
  /// - [minpimumconfidence] : Minimum Confidence (Default: 55)
  ///
  /// Returns [TransformationData].
  TransformationData detectLabels(
    int? maximumlabels,
    int? minpimumconfidence,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (maximumlabels != null) {
      values['l'] = maximumlabels.toString();
    }

    if (minpimumconfidence != null) {
      values['c'] = minpimumconfidence.toString();
    }

    return TransformationData(
        plugin: 'awsRek', name: 'detectLabels', values: values);
  }
}

class Moderation {
  /// Method for Detect objects and text in images
  ///
  /// - [minpimumconfidence] : Minimum Confidence (Default: 55)
  ///
  /// Returns [TransformationData].
  TransformationData moderation(
    int? minpimumconfidence,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (minpimumconfidence != null) {
      values['c'] = minpimumconfidence.toString();
    }

    return TransformationData(
        plugin: 'awsRek', name: 'moderation', values: values);
  }
}
