import '../transformation_data.dart';

class VideoWatermarkRemoval {
  /// Method for Video Watermark Removal Plugin
  /// @return TransformationData.
  TransformationData remove() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'wmv', name: 'remove', values: values);
  }
}
