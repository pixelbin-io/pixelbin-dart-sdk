import '../transformation_data.dart';

class VariationGenerator {
  /// Method for AI Variation Generator
  ///
  /// - [generatevariationprompt] : Generate variation prompt (Default: )
  ///
  /// - [noofvariations] : No. of Variations (Default: 1)
  ///
  /// - [seed] : Seed (Default: 0)
  ///
  /// - [autoscale] : Autoscale (Default: true)
  ///
  /// Returns [TransformationData].
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
