import '../transformation_data.dart';

class VsrUpscale {
  /// Method for Video Upscaler Plugin
  /// Returns [TransformationData].
  TransformationData upscale() {
    var values = <String, String>{};
    return TransformationData(plugin: 'vsr', name: 'upscale', values: values);
  }
}
