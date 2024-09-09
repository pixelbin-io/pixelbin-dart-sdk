import '../transformation_data.dart';

class VgGenerate {
  /// Method for AI Variation Generator
  ///
  ///
  /// - [generateVariationPrompt] : Generate variation prompt (Default: )
  ///
  ///
  ///
  /// - [noOfVariations] : No. of Variations (Default: 1)
  ///
  ///
  ///
  /// - [seed] : Seed (Default: 0)
  ///
  ///
  ///
  /// - [autoscale] : Autoscale (Default: true)
  ///
  ///
  /// Returns [TransformationData].
  TransformationData generate(
    String? generateVariationPrompt,
    int? noOfVariations,
    int? seed,
    bool? autoscale,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (generateVariationPrompt != null) {
      values['p'] = generateVariationPrompt.toString();
    }

    if (noOfVariations != null) {
      values['v'] = noOfVariations.toString();
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
