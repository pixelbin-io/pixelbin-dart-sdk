import '../transformation_data.dart';

class AwsrekDetectlabels {
  /// Method for Detect objects and text in images
  ///
  ///
  /// - [maximumLabels] : Maximum Labels (Default: 5)
  ///
  ///
  ///
  /// - [minimumConfidence] : Minimum Confidence (Default: 55)
  ///
  ///
  /// Returns [TransformationData].
  TransformationData detectLabels(
    int? maximumLabels,
    int? minimumConfidence,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (maximumLabels != null) {
      values['l'] = maximumLabels.toString();
    }

    if (minimumConfidence != null) {
      values['c'] = minimumConfidence.toString();
    }

    return TransformationData(
        plugin: 'awsRek', name: 'detectLabels', values: values);
  }
}

class AwsrekModeration {
  /// Method for Detect objects and text in images
  ///
  ///
  /// - [minimumConfidence] : Minimum Confidence (Default: 55)
  ///
  ///
  /// Returns [TransformationData].
  TransformationData moderation(
    int? minimumConfidence,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (minimumConfidence != null) {
      values['c'] = minimumConfidence.toString();
    }

    return TransformationData(
        plugin: 'awsRek', name: 'moderation', values: values);
  }
}
