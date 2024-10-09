import '../transformation_data.dart';

/// Detector options: face, text, number_plate
enum ImDetector {
  face('face'),
  text('text'),
  numberPlate('number_plate');

  final String value;
  const ImDetector(this.value);
}

/// Mask type options: fill_black, pixelate, blur
enum ImMaskType {
  fillBlack('fill_black'),
  pixelate('pixelate'),
  blur('blur');

  final String value;
  const ImMaskType(this.value);
}

class ImMask {
  /// Method for Intelligent Masking
  /// - [replacementImage] : Replacement Image (Default: )
  /// - [detector] : ImDetector (Default: number_plate)
  /// - [maskType] : ImMaskType (Default: fill_black)
  /// Returns [TransformationData].
  TransformationData mask(
    String? replacementImage,
    ImDetector? detector,
    ImMaskType? maskType,
  ) {
    var values = <String, String>{};
    if (replacementImage != null) {
      values['i'] = replacementImage.toString();
    }
    if (detector != null) {
      values['d'] = detector.value;
    }
    if (maskType != null) {
      values['m'] = maskType.value;
    }
    return TransformationData(plugin: 'im', name: 'mask', values: values);
  }
}
