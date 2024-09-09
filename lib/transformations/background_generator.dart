import '../transformation_data.dart';

/// Focus options: Product, Background
enum GenerateFocus {
  product('Product'),

  background('Background');

  final String value;

  const GenerateFocus(this.value);
}

class GenerateBg {
  /// Method for AI Background Generator
  ///
  ///
  /// - [backgroundPrompt] : Background prompt (Default: YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr)
  ///
  ///
  ///
  /// - [focus] : GenerateFocus (Default: Product)
  ///
  ///
  ///
  /// - [negativePrompt] : Negative prompt (Default: )
  ///
  ///
  ///
  /// - [seed] : seed (Default: 123)
  ///
  ///
  /// Returns [TransformationData].
  TransformationData bg(
    String? backgroundPrompt,
    GenerateFocus? focus,
    String? negativePrompt,
    int? seed,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (backgroundPrompt != null) {
      values['p'] = backgroundPrompt.toString();
    }

    if (focus != null) {
      values['f'] = focus.value;
    }

    if (negativePrompt != null) {
      values['np'] = negativePrompt.toString();
    }

    if (seed != null) {
      values['s'] = seed.toString();
    }

    return TransformationData(plugin: 'generate', name: 'bg', values: values);
  }
}
