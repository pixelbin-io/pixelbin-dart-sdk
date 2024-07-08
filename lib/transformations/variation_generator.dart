import '../transformation_data.dart';

class VariationGenerator {
  /// Method for AI Variation Generator
  ///
  /// @param Generate variation prompt String (Default: )
  ///
  /// @param No. of Variations int (Default: 1)
  ///
  /// @param Seed int (Default: 0)
  ///
  /// @param Autoscale bool (Default: true)
  ///
  /// @return TransformationData.
  TransformationData generate(
    String? generatevariationprompt,
    int? noofvariations,
    int? seed,
    bool? autoscale,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (generatevariationprompt != null) {
      values['p'] = generatevariationprompt.toString();
    }

    if (noofvariations != null) {
      values['v'] = noofvariations.toString();
    }

    if (seed != null) {
      values['s'] = seed.toString();
    }

    if (autoscale != null) {
      values['auto'] = autoscale.toString();
    }

    return TransformationData(plugin: 'vg', name: 'generate', values: values);
  }
}
