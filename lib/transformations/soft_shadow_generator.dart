import '../transformation_data.dart';

class SoftShadowGenerator {
  /// Method for AI Soft Shadow Generator
  /// @param Background Image String
  /// @param Background Color String (Default: "ffffff")
  /// @param Shadow Angle double (Default: 120)
  /// @param Shadow Intensity double (Default: 0.5)
  /// @return TransformationData.
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
