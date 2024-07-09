import '../transformation_data.dart';

/// Focus options: Product, Background
enum Focus {
  product('Product'),

  background('Background');

  final String value;

  const Focus(this.value);
}

class BackgroundGenerator {
  /// Method for AI Background Generator
  ///
  /// - [backgroundprompt] : Background prompt (Default: YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr)
  ///
  /// - [focus] : focus (Default: Product)
  ///
  /// - [negativeprompt] : Negative prompt (Default: )
  ///
  /// - [seed] : seed (Default: 123)
  ///
  /// Returns [TransformationData].
  TransformationData bg(
    String? backgroundprompt,
    Focus? focus,
    String? negativeprompt,
    int? seed,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (backgroundprompt != null) {
      values['p'] = backgroundprompt.toString();
    }

    if (focus != null) {
      values['f'] = focus.value;
    }

    if (negativeprompt != null) {
      values['np'] = negativeprompt.toString();
    }

    if (seed != null) {
      values['s'] = seed.toString();
    }

    return TransformationData(plugin: 'generate', name: 'bg', values: values);
  }
}
