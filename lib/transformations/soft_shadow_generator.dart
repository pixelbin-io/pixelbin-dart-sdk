import '../transformation_data.dart';

class SoftShadowGenerator {
  /// Method for AI Soft Shadow Generator
  ///
  /// - [backgroundimage] : Background Image (Default: )
  ///
  /// - [backgroundcolor] : Background Color (Default: "ffffff")
  ///
  /// - [shadowangle] : Shadow Angle (Default: 120)
  ///
  /// - [shadowintensity] : Shadow Intensity (Default: 0.5)
  ///
  /// Returns [TransformationData].
  TransformationData gen(
    String? backgroundimage,
    String? backgroundcolor,
    double? shadowangle,
    double? shadowintensity,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (backgroundimage != null) {
      values['bgi'] = backgroundimage.toString();
    }

    if (backgroundcolor != null && backgroundcolor.isNotEmpty) {
      values['bgc'] = backgroundcolor;
    }

    if (shadowangle != null) {
      values['a'] = shadowangle.toString();
    }

    if (shadowintensity != null) {
      values['i'] = shadowintensity.toString();
    }

    return TransformationData(plugin: 'shadow', name: 'gen', values: values);
  }
}
