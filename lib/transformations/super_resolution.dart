import '../transformation_data.dart';

/// Type options: 2x, 4x, 8x
enum SrType {
  p2X('2x'),

  p4X('4x'),

  p8X('8x');

  final String value;

  const SrType(this.value);
}

/// Model options: Picasso, Flash
enum SrModel {
  picasso('Picasso'),

  flash('Flash');

  final String value;

  const SrModel(this.value);
}

class SrUpscale {
  /// Method for Super Resolution Module
  ///
  ///
  /// - [type] : SrType (Default: 2x)
  ///
  ///
  ///
  /// - [enhanceFace] : Enhance Face (Default: false)
  ///
  ///
  ///
  /// - [model] : SrModel (Default: Picasso)
  ///
  ///
  ///
  /// - [enhanceQuality] : Enhance Quality (Default: false)
  ///
  ///
  /// Returns [TransformationData].
  TransformationData upscale(
    SrType? type,
    bool? enhanceFace,
    SrModel? model,
    bool? enhanceQuality,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (type != null) {
      values['t'] = type.value;
    }

    if (enhanceFace != null) {
      values['enhance_face'] = enhanceFace.toString();
    }

    if (model != null) {
      values['model'] = model.value;
    }

    if (enhanceQuality != null) {
      values['enhance_quality'] = enhanceQuality.toString();
    }

    return TransformationData(plugin: 'sr', name: 'upscale', values: values);
  }
}
