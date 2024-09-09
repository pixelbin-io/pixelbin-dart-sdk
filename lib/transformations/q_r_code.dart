import '../transformation_data.dart';

/// QR Error Correction Level options: L, M, Q, H
enum QrQrerrorcorrectionlevel {
  l('L'),

  m('M'),

  q('Q'),

  h('H');

  final String value;

  const QrQrerrorcorrectionlevel(this.value);
}

/// Dots Type options: rounded, dots, classy, classy-rounded, square, extra-rounded
enum QrDotsType {
  rounded('rounded'),

  dots('dots'),

  classy('classy'),

  classyRounded('classy-rounded'),

  square('square'),

  extraRounded('extra-rounded');

  final String value;

  const QrDotsType(this.value);
}

/// Corner Square Type options: dot, square, extra-rounded
enum QrCornersquareType {
  dot('dot'),

  square('square'),

  extraRounded('extra-rounded');

  final String value;

  const QrCornersquareType(this.value);
}

/// Corner Dots Type options: dot, square
enum QrCornerdotsType {
  dot('dot'),

  square('square');

  final String value;

  const QrCornerdotsType(this.value);
}

class QrGenerate {
  /// Method for QRCode Plugin
  ///
  ///
  /// - [width] : width (Default: 300)
  ///
  ///
  ///
  /// - [height] : height (Default: 300)
  ///
  ///
  ///
  /// - [image] : image (Default: )
  ///
  ///
  ///
  /// - [margin] : margin (Default: 0)
  ///
  ///
  ///
  /// - [qRTypeNumber] : qRTypeNumber (Default: 0)
  ///
  ///
  ///
  /// - [qrErrorCorrectionLevel] : QrQrerrorcorrectionlevel (Default: Q)
  ///
  ///
  ///
  /// - [imageSize] : imageSize (Default: 0.4)
  ///
  ///
  ///
  /// - [imageMargin] : imageMargin (Default: 0)
  ///
  ///
  ///
  /// - [dotsColor] : dotsColor (Default: "000000")
  ///
  ///
  ///
  /// - [dotsType] : QrDotsType (Default: square)
  ///
  ///
  ///
  /// - [dotsBgColor] : dotsBgColor (Default: "ffffff")
  ///
  ///
  ///
  /// - [cornerSquareColor] : cornerSquareColor (Default: "000000")
  ///
  ///
  ///
  /// - [cornerSquareType] : QrCornersquareType (Default: square)
  ///
  ///
  ///
  /// - [cornerDotsColor] : cornerDotsColor (Default: "000000")
  ///
  ///
  ///
  /// - [cornerDotsType] : QrCornerdotsType (Default: dot)
  ///
  ///
  /// Returns [TransformationData].
  TransformationData generate(
    int? width,
    int? height,
    String? image,
    int? margin,
    int? qRTypeNumber,
    QrQrerrorcorrectionlevel? qrErrorCorrectionLevel,
    double? imageSize,
    int? imageMargin,
    String? dotsColor,
    QrDotsType? dotsType,
    String? dotsBgColor,
    String? cornerSquareColor,
    QrCornersquareType? cornerSquareType,
    String? cornerDotsColor,
    QrCornerdotsType? cornerDotsType,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (width != null) {
      values['w'] = width.toString();
    }

    if (height != null) {
      values['h'] = height.toString();
    }

    if (image != null) {
      values['i'] = image.toString();
    }

    if (margin != null) {
      values['m'] = margin.toString();
    }

    if (qRTypeNumber != null) {
      values['qt'] = qRTypeNumber.toString();
    }

    if (qrErrorCorrectionLevel != null) {
      values['qe'] = qrErrorCorrectionLevel.value;
    }

    if (imageSize != null) {
      values['is'] = imageSize.toString();
    }

    if (imageMargin != null) {
      values['im'] = imageMargin.toString();
    }

    if (dotsColor != null && dotsColor.isNotEmpty) {
      values['ds'] = dotsColor;
    }

    if (dotsType != null) {
      values['dt'] = dotsType.value;
    }

    if (dotsBgColor != null && dotsBgColor.isNotEmpty) {
      values['bg'] = dotsBgColor;
    }

    if (cornerSquareColor != null && cornerSquareColor.isNotEmpty) {
      values['csc'] = cornerSquareColor;
    }

    if (cornerSquareType != null) {
      values['cst'] = cornerSquareType.value;
    }

    if (cornerDotsColor != null && cornerDotsColor.isNotEmpty) {
      values['cdc'] = cornerDotsColor;
    }

    if (cornerDotsType != null) {
      values['cdt'] = cornerDotsType.value;
    }

    return TransformationData(plugin: 'qr', name: 'generate', values: values);
  }
}

class QrScan {
  /// Method for QRCode Plugin
  ///
  /// Returns [TransformationData].
  TransformationData scan() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 'qr', name: 'scan', values: values);
  }
}
