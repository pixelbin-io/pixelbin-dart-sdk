import '../transformation_data.dart';

class ShadowGen {
  /// Method for AI Soft Shadow Generator
  /// - [backgroundImage] : Background Image (Default: )
  /// - [backgroundColor] : Background Color (Default: "ffffff")
  /// - [shadowAngle] : Shadow Angle (Default: 120)
  /// - [shadowIntensity] : Shadow Intensity (Default: 0.5)
  /// Returns [TransformationData].
  TransformationData gen(
    String? backgroundImage,
    String? backgroundColor,
    double? shadowAngle,
    double? shadowIntensity,
  ) {
    var values = <String, String>{};
    if (backgroundImage != null) {
      values['bgi'] = backgroundImage.toString();
    }
    if (backgroundColor != null && backgroundColor.isNotEmpty) {
      values['bgc'] = backgroundColor;
    }
    if (shadowAngle != null) {
      values['a'] = shadowAngle.toString();
    }
    if (shadowIntensity != null) {
      values['i'] = shadowIntensity.toString();
    }
    return TransformationData(plugin: 'shadow', name: 'gen', values: values);
  }
}
