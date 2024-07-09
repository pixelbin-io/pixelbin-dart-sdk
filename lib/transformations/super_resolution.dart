import '../transformation_data.dart';

/// Type options: 2x, 4x, 8x
enum PType {
  p2x('2x'),

  p4x('4x'),

  p8x('8x');

  final String value;

  const PType(this.value);
}

/// Model options: Picasso, Flash
enum Model {
  picasso('Picasso'),

  flash('Flash');

  final String value;

  const Model(this.value);
}

class SuperResolution {
  /// Method for Super Resolution Module
  ///
  /// - [ptype] : Type (Default: 2x)
  ///
  /// - [enhanceface] : Enhance Face (Default: false)
  ///
  /// - [model] : Model (Default: Picasso)
  ///
  /// - [enhancequality] : Enhance Quality (Default: false)
  ///
  /// Returns [TransformationData].
  TransformationData upscale(
    PType? ptype,
    bool? enhanceface,
    Model? model,
    bool? enhancequality,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (ptype != null) {
      values['t'] = ptype.value;
    }

    if (enhanceface != null) {
      values['enhance_face'] = enhanceface.toString();
    }

    if (model != null) {
      values['model'] = model.value;
    }

    if (enhancequality != null) {
      values['enhance_quality'] = enhancequality.toString();
    }

    return TransformationData(plugin: 'sr', name: 'upscale', values: values);
  }
}
