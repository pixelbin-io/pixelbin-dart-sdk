import '../transformation_data.dart';

class VertexaiGeneratebg {
  /// Method for Vertex AI based transformations
  /// - [backgroundPrompt] : Background prompt (Default: YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr)
  /// - [negativePrompt] : Negative prompt (Default: )
  /// - [seed] : seed (Default: 22)
  /// - [guidanceScale] : Guidance Scale (Default: 60)
  /// Returns [TransformationData].
  TransformationData generateBG(
    String? backgroundPrompt,
    String? negativePrompt,
    int? seed,
    int? guidanceScale,
  ) {
    var values = <String, String>{};
    if (backgroundPrompt != null) {
      values['p'] = backgroundPrompt.toString();
    }
    if (negativePrompt != null) {
      values['np'] = negativePrompt.toString();
    }
    if (seed != null) {
      values['s'] = seed.toString();
    }
    if (guidanceScale != null) {
      values['gs'] = guidanceScale.toString();
    }
    return TransformationData(
        plugin: 'vertexAi', name: 'generateBG', values: values);
  }
}

class VertexaiRemovebg {
  /// Method for Vertex AI based transformations
  /// Returns [TransformationData].
  TransformationData removeBG() {
    var values = <String, String>{};
    return TransformationData(
        plugin: 'vertexAi', name: 'removeBG', values: values);
  }
}

/// Type options: x2, x4
enum VertexaiType {
  x2('x2'),
  x4('x4');

  final String value;
  const VertexaiType(this.value);
}

class VertexaiUpscale {
  /// Method for Vertex AI based transformations
  /// - [type] : VertexaiType (Default: x2)
  /// Returns [TransformationData].
  TransformationData upscale(
    VertexaiType? type,
  ) {
    var values = <String, String>{};
    if (type != null) {
      values['t'] = type.value;
    }
    return TransformationData(
        plugin: 'vertexAi', name: 'upscale', values: values);
  }
}
