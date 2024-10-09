import '../transformation_data.dart';

/// Fit options: cover, contain, fill, inside, outside
enum TFit {
  cover('cover'),
  containp('contain'),
  fill('fill'),
  inpside('inside'),
  outside('outside');

  final String value;
  const TFit(this.value);
}

/// Position options: top, bottom, left, right, right_top, right_bottom, left_top, left_bottom, center
enum TPosition {
  top('top'),
  bottom('bottom'),
  left('left'),
  right('right'),
  rightTop('right_top'),
  rightBottom('right_bottom'),
  leftTop('left_top'),
  leftBottom('left_bottom'),
  center('center');

  final String value;
  const TPosition(this.value);
}

/// Algorithm options: nearest, cubic, mitchell, lanczos2, lanczos3
enum TAlgorithm {
  nearest('nearest'),
  cubic('cubic'),
  mitchell('mitchell'),
  lanczos2('lanczos2'),
  lanczos3('lanczos3');

  final String value;
  const TAlgorithm(this.value);
}

class TResize {
  /// Method for Basic Transformations
  /// - [height] : height (Default: 0)
  /// - [width] : width (Default: 0)
  /// - [fit] : TFit (Default: cover)
  /// - [background] : background (Default: "000000")
  /// - [position] : TPosition (Default: center)
  /// - [algorithm] : TAlgorithm (Default: lanczos3)
  /// - [dpr] : DPR (Default: 1)
  /// Returns [TransformationData].
  TransformationData resize(
    int? height,
    int? width,
    TFit? fit,
    String? background,
    TPosition? position,
    TAlgorithm? algorithm,
    double? dpr,
  ) {
    var values = <String, String>{};
    if (height != null) {
      values['h'] = height.toString();
    }
    if (width != null) {
      values['w'] = width.toString();
    }
    if (fit != null) {
      values['f'] = fit.value;
    }
    if (background != null && background.isNotEmpty) {
      values['b'] = background;
    }
    if (position != null) {
      values['p'] = position.value;
    }
    if (algorithm != null) {
      values['k'] = algorithm.value;
    }
    if (dpr != null) {
      values['dpr'] = dpr.toString();
    }
    return TransformationData(plugin: 't', name: 'resize', values: values);
  }
}

class TCompress {
  /// Method for Basic Transformations
  /// - [quality] : quality (Default: 80)
  /// Returns [TransformationData].
  TransformationData compress(
    int? quality,
  ) {
    var values = <String, String>{};
    if (quality != null) {
      values['q'] = quality.toString();
    }
    return TransformationData(plugin: 't', name: 'compress', values: values);
  }
}

/// Border type options: constant, replicate, reflect, wrap
enum TBorderType {
  constant('constant'),
  replicate('replicate'),
  reflect('reflect'),
  wrap('wrap');

  final String value;
  const TBorderType(this.value);
}

class TExtend {
  /// Method for Basic Transformations
  /// - [top] : top (Default: 10)
  /// - [left] : left (Default: 10)
  /// - [bottom] : bottom (Default: 10)
  /// - [right] : right (Default: 10)
  /// - [background] : background (Default: "000000")
  /// - [borderType] : TBorderType (Default: constant)
  /// - [dpr] : DPR (Default: 1)
  /// Returns [TransformationData].
  TransformationData extend(
    int? top,
    int? left,
    int? bottom,
    int? right,
    String? background,
    TBorderType? borderType,
    double? dpr,
  ) {
    var values = <String, String>{};
    if (top != null) {
      values['t'] = top.toString();
    }
    if (left != null) {
      values['l'] = left.toString();
    }
    if (bottom != null) {
      values['b'] = bottom.toString();
    }
    if (right != null) {
      values['r'] = right.toString();
    }
    if (background != null && background.isNotEmpty) {
      values['bc'] = background;
    }
    if (borderType != null) {
      values['bt'] = borderType.value;
    }
    if (dpr != null) {
      values['dpr'] = dpr.toString();
    }
    return TransformationData(plugin: 't', name: 'extend', values: values);
  }
}

class TExtract {
  /// Method for Basic Transformations
  /// - [top] : top (Default: 10)
  /// - [left] : left (Default: 10)
  /// - [height] : height (Default: 50)
  /// - [width] : width (Default: 20)
  /// - [boundingBox] : Bounding Box (Default: )
  /// Returns [TransformationData].
  TransformationData extract(
    int? top,
    int? left,
    int? height,
    int? width,
    String? boundingBox,
  ) {
    var values = <String, String>{};
    if (top != null) {
      values['t'] = top.toString();
    }
    if (left != null) {
      values['l'] = left.toString();
    }
    if (height != null) {
      values['h'] = height.toString();
    }
    if (width != null) {
      values['w'] = width.toString();
    }
    if (boundingBox != null) {
      values['bbox'] = boundingBox.toString();
    }
    return TransformationData(plugin: 't', name: 'extract', values: values);
  }
}

class TTrim {
  /// Method for Basic Transformations
  /// - [threshold] : threshold (Default: 10)
  /// Returns [TransformationData].
  TransformationData trim(
    int? threshold,
  ) {
    var values = <String, String>{};
    if (threshold != null) {
      values['t'] = threshold.toString();
    }
    return TransformationData(plugin: 't', name: 'trim', values: values);
  }
}

class TRotate {
  /// Method for Basic Transformations
  /// - [angle] : angle (Default: 0)
  /// - [background] : background (Default: "000000")
  /// Returns [TransformationData].
  TransformationData rotate(
    int? angle,
    String? background,
  ) {
    var values = <String, String>{};
    if (angle != null) {
      values['a'] = angle.toString();
    }
    if (background != null && background.isNotEmpty) {
      values['b'] = background;
    }
    return TransformationData(plugin: 't', name: 'rotate', values: values);
  }
}

class TFlip {
  /// Method for Basic Transformations
  /// Returns [TransformationData].
  TransformationData flip() {
    var values = <String, String>{};
    return TransformationData(plugin: 't', name: 'flip', values: values);
  }
}

class TFlop {
  /// Method for Basic Transformations
  /// Returns [TransformationData].
  TransformationData flop() {
    var values = <String, String>{};
    return TransformationData(plugin: 't', name: 'flop', values: values);
  }
}

class TSharpen {
  /// Method for Basic Transformations
  /// - [sigma] : sigma (Default: 1.5)
  /// Returns [TransformationData].
  TransformationData sharpen(
    double? sigma,
  ) {
    var values = <String, String>{};
    if (sigma != null) {
      values['s'] = sigma.toString();
    }
    return TransformationData(plugin: 't', name: 'sharpen', values: values);
  }
}

class TMedian {
  /// Method for Basic Transformations
  /// - [size] : size (Default: 3)
  /// Returns [TransformationData].
  TransformationData median(
    int? size,
  ) {
    var values = <String, String>{};
    if (size != null) {
      values['s'] = size.toString();
    }
    return TransformationData(plugin: 't', name: 'median', values: values);
  }
}

class TBlur {
  /// Method for Basic Transformations
  /// - [sigma] : sigma (Default: 0.3)
  /// - [dpr] : DPR (Default: 1)
  /// Returns [TransformationData].
  TransformationData blur(
    double? sigma,
    double? dpr,
  ) {
    var values = <String, String>{};
    if (sigma != null) {
      values['s'] = sigma.toString();
    }
    if (dpr != null) {
      values['dpr'] = dpr.toString();
    }
    return TransformationData(plugin: 't', name: 'blur', values: values);
  }
}

class TFlatten {
  /// Method for Basic Transformations
  /// - [background] : background (Default: "000000")
  /// Returns [TransformationData].
  TransformationData flatten(
    String? background,
  ) {
    var values = <String, String>{};
    if (background != null && background.isNotEmpty) {
      values['b'] = background;
    }
    return TransformationData(plugin: 't', name: 'flatten', values: values);
  }
}

class TNegate {
  /// Method for Basic Transformations
  /// Returns [TransformationData].
  TransformationData negate() {
    var values = <String, String>{};
    return TransformationData(plugin: 't', name: 'negate', values: values);
  }
}

class TNormalise {
  /// Method for Basic Transformations
  /// Returns [TransformationData].
  TransformationData normalise() {
    var values = <String, String>{};
    return TransformationData(plugin: 't', name: 'normalise', values: values);
  }
}

class TLinear {
  /// Method for Basic Transformations
  /// - [a] : a (Default: 1)
  /// - [b] : b (Default: 0)
  /// Returns [TransformationData].
  TransformationData linear(
    int? a,
    int? b,
  ) {
    var values = <String, String>{};
    if (a != null) {
      values['a'] = a.toString();
    }
    if (b != null) {
      values['b'] = b.toString();
    }
    return TransformationData(plugin: 't', name: 'linear', values: values);
  }
}

class TModulate {
  /// Method for Basic Transformations
  /// - [brightness] : brightness (Default: 1)
  /// - [saturation] : saturation (Default: 1)
  /// - [hue] : hue (Default: 90)
  /// Returns [TransformationData].
  TransformationData modulate(
    double? brightness,
    double? saturation,
    int? hue,
  ) {
    var values = <String, String>{};
    if (brightness != null) {
      values['b'] = brightness.toString();
    }
    if (saturation != null) {
      values['s'] = saturation.toString();
    }
    if (hue != null) {
      values['h'] = hue.toString();
    }
    return TransformationData(plugin: 't', name: 'modulate', values: values);
  }
}

class TGrey {
  /// Method for Basic Transformations
  /// Returns [TransformationData].
  TransformationData grey() {
    var values = <String, String>{};
    return TransformationData(plugin: 't', name: 'grey', values: values);
  }
}

class TTint {
  /// Method for Basic Transformations
  /// - [color] : color (Default: "000000")
  /// Returns [TransformationData].
  TransformationData tint(
    String? color,
  ) {
    var values = <String, String>{};
    if (color != null && color.isNotEmpty) {
      values['c'] = color;
    }
    return TransformationData(plugin: 't', name: 'tint', values: values);
  }
}

/// Format options: jpeg, png, webp, tiff, avif, bmp, heif
enum TFormat {
  jpeg('jpeg'),
  png('png'),
  webp('webp'),
  tiff('tiff'),
  avif('avif'),
  bmp('bmp'),
  heif('heif');

  final String value;
  const TFormat(this.value);
}

/// Quality options: 100, 95, 90, 85, 80, 75, 70, 60, 50, 40, 30, 20, 10, best, good, eco, low
enum TQuality {
  p100('100'),
  p95('95'),
  p90('90'),
  p85('85'),
  p80('80'),
  p75('75'),
  p70('70'),
  p60('60'),
  p50('50'),
  p40('40'),
  p30('30'),
  p20('20'),
  p10('10'),
  best('best'),
  good('good'),
  eco('eco'),
  low('low');

  final String value;
  const TQuality(this.value);
}

class TToformat {
  /// Method for Basic Transformations
  /// - [format] : TFormat (Default: jpeg)
  /// - [quality] : TQuality (Default: 75)
  /// Returns [TransformationData].
  TransformationData toFormat(
    TFormat? format,
    TQuality? quality,
  ) {
    var values = <String, String>{};
    if (format != null) {
      values['f'] = format.value;
    }
    if (quality != null) {
      values['q'] = quality.value;
    }
    return TransformationData(plugin: 't', name: 'toFormat', values: values);
  }
}

class TDensity {
  /// Method for Basic Transformations
  /// - [density] : density (Default: 300)
  /// Returns [TransformationData].
  TransformationData density(
    int? density,
  ) {
    var values = <String, String>{};
    if (density != null) {
      values['d'] = density.toString();
    }
    return TransformationData(plugin: 't', name: 'density', values: values);
  }
}

/// Mode options: overlay, underlay, wrap
enum TMode {
  overlay('overlay'),
  underlay('underlay'),
  wrap('wrap');

  final String value;
  const TMode(this.value);
}

/// Gravity options: northwest, north, northeast, east, center, west, southwest, south, southeast, custom
enum TGravity {
  northwest('northwest'),
  north('north'),
  northeast('northeast'),
  east('east'),
  center('center'),
  west('west'),
  southwest('southwest'),
  south('south'),
  southeast('southeast'),
  custom('custom');

  final String value;
  const TGravity(this.value);
}

/// Blend options: over, in, out, atop, dest, dest-over, dest-in, dest-out, dest-atop, xor, add, saturate, multiply, screen, overlay, darken, lighten, colour-dodge, color-dodge, colour-burn, color-burn, hard-light, soft-light, difference, exclusion
enum TBlend {
  over('over'),
  inp('in'),
  out('out'),
  atop('atop'),
  dest('dest'),
  destOver('dest-over'),
  destIn('dest-in'),
  destOut('dest-out'),
  destAtop('dest-atop'),
  xor('xor'),
  add('add'),
  saturate('saturate'),
  multiply('multiply'),
  screen('screen'),
  overlay('overlay'),
  darken('darken'),
  lighten('lighten'),
  colourDodge('colour-dodge'),
  colorDodge('color-dodge'),
  colourBurn('colour-burn'),
  colorBurn('color-burn'),
  hardLight('hard-light'),
  softLight('soft-light'),
  difference('difference'),
  exclusion('exclusion');

  final String value;
  const TBlend(this.value);
}

class TMerge {
  /// Method for Basic Transformations
  /// - [mode] : TMode (Default: overlay)
  /// - [image] : image (Default: )
  /// - [transformation] : transformation (Default: )
  /// - [background] : background (Default: "00000000")
  /// - [height] : height (Default: 0)
  /// - [width] : width (Default: 0)
  /// - [top] : top (Default: 0)
  /// - [left] : left (Default: 0)
  /// - [gravity] : TGravity (Default: center)
  /// - [blend] : TBlend (Default: over)
  /// - [tile] : tile (Default: false)
  /// - [listOfBboxes] : List of bboxes (Default: )
  /// - [listOfPolygons] : List of Polygons (Default: )
  /// Returns [TransformationData].
  TransformationData merge(
    TMode? mode,
    String? image,
    String? transformation,
    String? background,
    int? height,
    int? width,
    int? top,
    int? left,
    TGravity? gravity,
    TBlend? blend,
    bool? tile,
    String? listOfBboxes,
    String? listOfPolygons,
  ) {
    var values = <String, String>{};
    if (mode != null) {
      values['m'] = mode.value;
    }
    if (image != null) {
      values['i'] = image.toString();
    }
    if (transformation != null) {
      values['tr'] = transformation.toString();
    }
    if (background != null && background.isNotEmpty) {
      values['bg'] = background;
    }
    if (height != null) {
      values['h'] = height.toString();
    }
    if (width != null) {
      values['w'] = width.toString();
    }
    if (top != null) {
      values['t'] = top.toString();
    }
    if (left != null) {
      values['l'] = left.toString();
    }
    if (gravity != null) {
      values['g'] = gravity.value;
    }
    if (blend != null) {
      values['b'] = blend.value;
    }
    if (tile != null) {
      values['r'] = tile.toString();
    }
    if (listOfBboxes != null) {
      values['bboxes'] = listOfBboxes.toString();
    }
    if (listOfPolygons != null) {
      values['polys'] = listOfPolygons.toString();
    }
    return TransformationData(plugin: 't', name: 'merge', values: values);
  }
}
