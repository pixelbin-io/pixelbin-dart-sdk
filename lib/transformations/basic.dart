import '../transformation_data.dart';

/// Fit options: cover, contain, fill, inside, outside
enum Fit {
  cover('cover'),

  containp('contain'),

  fill('fill'),

  inpside('inside'),

  outside('outside');

  final String value;

  const Fit(this.value);
}

/// Position options: top, bottom, left, right, right_top, right_bottom, left_top, left_bottom, center
enum Position {
  top('top'),

  bottom('bottom'),

  left('left'),

  right('right'),

  right_top('right_top'),

  right_bottom('right_bottom'),

  left_top('left_top'),

  left_bottom('left_bottom'),

  center('center');

  final String value;

  const Position(this.value);
}

/// Algorithm options: nearest, cubic, mitchell, lanczos2, lanczos3
enum Algorithm {
  nearest('nearest'),

  cubic('cubic'),

  mitchell('mitchell'),

  lanczos2('lanczos2'),

  lanczos3('lanczos3');

  final String value;

  const Algorithm(this.value);
}

class Resize {
  /// Method for Basic Transformations
  ///
  /// - [height] : height (Default: 0)
  ///
  /// - [width] : width (Default: 0)
  ///
  /// - [fit] : fit (Default: cover)
  ///
  /// - [background] : background (Default: "000000")
  ///
  /// - [position] : position (Default: center)
  ///
  /// - [algorithm] : algorithm (Default: lanczos3)
  ///
  /// - [dpr] : DPR (Default: 1)
  ///
  /// Returns [TransformationData].
  TransformationData resize(
    int? height,
    int? width,
    Fit? fit,
    String? background,
    Position? position,
    Algorithm? algorithm,
    double? dpr,
  ) {
    // Determine if there are values to add to the dictionary

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

class Compress {
  /// Method for Basic Transformations
  ///
  /// - [quality] : quality (Default: 80)
  ///
  /// Returns [TransformationData].
  TransformationData compress(
    int? quality,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (quality != null) {
      values['q'] = quality.toString();
    }

    return TransformationData(plugin: 't', name: 'compress', values: values);
  }
}

/// Border type options: constant, replicate, reflect, wrap
enum Bordertype {
  constant('constant'),

  replicate('replicate'),

  reflect('reflect'),

  wrap('wrap');

  final String value;

  const Bordertype(this.value);
}

class Extend {
  /// Method for Basic Transformations
  ///
  /// - [top] : top (Default: 10)
  ///
  /// - [left] : left (Default: 10)
  ///
  /// - [bottom] : bottom (Default: 10)
  ///
  /// - [right] : right (Default: 10)
  ///
  /// - [background] : background (Default: "000000")
  ///
  /// - [borderptype] : Border Type (Default: constant)
  ///
  /// - [dpr] : DPR (Default: 1)
  ///
  /// Returns [TransformationData].
  TransformationData extend(
    int? top,
    int? left,
    int? bottom,
    int? right,
    String? background,
    Bordertype? borderptype,
    double? dpr,
  ) {
    // Determine if there are values to add to the dictionary

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

    if (borderptype != null) {
      values['bt'] = borderptype.value;
    }

    if (dpr != null) {
      values['dpr'] = dpr.toString();
    }

    return TransformationData(plugin: 't', name: 'extend', values: values);
  }
}

class Extract {
  /// Method for Basic Transformations
  ///
  /// - [top] : top (Default: 10)
  ///
  /// - [left] : left (Default: 10)
  ///
  /// - [height] : height (Default: 50)
  ///
  /// - [width] : width (Default: 20)
  ///
  /// - [boundinpgbox] : Bounding Box (Default: )
  ///
  /// Returns [TransformationData].
  TransformationData extract(
    int? top,
    int? left,
    int? height,
    int? width,
    String? boundinpgbox,
  ) {
    // Determine if there are values to add to the dictionary

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

    if (boundinpgbox != null) {
      values['bbox'] = boundinpgbox.toString();
    }

    return TransformationData(plugin: 't', name: 'extract', values: values);
  }
}

class Trim {
  /// Method for Basic Transformations
  ///
  /// - [threshold] : threshold (Default: 10)
  ///
  /// Returns [TransformationData].
  TransformationData trim(
    int? threshold,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (threshold != null) {
      values['t'] = threshold.toString();
    }

    return TransformationData(plugin: 't', name: 'trim', values: values);
  }
}

class Rotate {
  /// Method for Basic Transformations
  ///
  /// - [angle] : angle (Default: 0)
  ///
  /// - [background] : background (Default: "000000")
  ///
  /// Returns [TransformationData].
  TransformationData rotate(
    int? angle,
    String? background,
  ) {
    // Determine if there are values to add to the dictionary

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

class Flip {
  /// Method for Basic Transformations
  ///
  /// Returns [TransformationData].
  TransformationData flip() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 't', name: 'flip', values: values);
  }
}

class Flop {
  /// Method for Basic Transformations
  ///
  /// Returns [TransformationData].
  TransformationData flop() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 't', name: 'flop', values: values);
  }
}

class Sharpen {
  /// Method for Basic Transformations
  ///
  /// - [sigma] : sigma (Default: 1.5)
  ///
  /// Returns [TransformationData].
  TransformationData sharpen(
    double? sigma,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (sigma != null) {
      values['s'] = sigma.toString();
    }

    return TransformationData(plugin: 't', name: 'sharpen', values: values);
  }
}

class Median {
  /// Method for Basic Transformations
  ///
  /// - [size] : size (Default: 3)
  ///
  /// Returns [TransformationData].
  TransformationData median(
    int? size,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (size != null) {
      values['s'] = size.toString();
    }

    return TransformationData(plugin: 't', name: 'median', values: values);
  }
}

class Blur {
  /// Method for Basic Transformations
  ///
  /// - [sigma] : sigma (Default: 0.3)
  ///
  /// - [dpr] : DPR (Default: 1)
  ///
  /// Returns [TransformationData].
  TransformationData blur(
    double? sigma,
    double? dpr,
  ) {
    // Determine if there are values to add to the dictionary

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

class Flatten {
  /// Method for Basic Transformations
  ///
  /// - [background] : background (Default: "000000")
  ///
  /// Returns [TransformationData].
  TransformationData flatten(
    String? background,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (background != null && background.isNotEmpty) {
      values['b'] = background;
    }

    return TransformationData(plugin: 't', name: 'flatten', values: values);
  }
}

class Negate {
  /// Method for Basic Transformations
  ///
  /// Returns [TransformationData].
  TransformationData negate() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 't', name: 'negate', values: values);
  }
}

class Normalise {
  /// Method for Basic Transformations
  ///
  /// Returns [TransformationData].
  TransformationData normalise() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 't', name: 'normalise', values: values);
  }
}

class Linear {
  /// Method for Basic Transformations
  ///
  /// - [a] : a (Default: 1)
  ///
  /// - [b] : b (Default: 0)
  ///
  /// Returns [TransformationData].
  TransformationData linear(
    int? a,
    int? b,
  ) {
    // Determine if there are values to add to the dictionary

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

class Modulate {
  /// Method for Basic Transformations
  ///
  /// - [brightness] : brightness (Default: 1)
  ///
  /// - [saturation] : saturation (Default: 1)
  ///
  /// - [hue] : hue (Default: 90)
  ///
  /// Returns [TransformationData].
  TransformationData modulate(
    double? brightness,
    double? saturation,
    int? hue,
  ) {
    // Determine if there are values to add to the dictionary

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

class Grey {
  /// Method for Basic Transformations
  ///
  /// Returns [TransformationData].
  TransformationData grey() {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    return TransformationData(plugin: 't', name: 'grey', values: values);
  }
}

class Tint {
  /// Method for Basic Transformations
  ///
  /// - [color] : color (Default: "000000")
  ///
  /// Returns [TransformationData].
  TransformationData tint(
    String? color,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (color != null && color.isNotEmpty) {
      values['c'] = color;
    }

    return TransformationData(plugin: 't', name: 'tint', values: values);
  }
}

/// Format options: jpeg, png, webp, tiff, avif, bmp, heif
enum Format {
  jpeg('jpeg'),

  png('png'),

  webp('webp'),

  tiff('tiff'),

  avif('avif'),

  bmp('bmp'),

  heif('heif');

  final String value;

  const Format(this.value);
}

class Toformat {
  /// Method for Basic Transformations
  ///
  /// - [format] : format (Default: jpeg)
  ///
  /// - [quality] : quality (Default: 75)
  ///
  /// Returns [TransformationData].
  TransformationData toFormat(
    Format? format,
    int? quality,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (format != null) {
      values['f'] = format.value;
    }

    if (quality != null) {
      values['q'] = quality.toString();
    }

    return TransformationData(plugin: 't', name: 'toFormat', values: values);
  }
}

class Density {
  /// Method for Basic Transformations
  ///
  /// - [density] : density (Default: 300)
  ///
  /// Returns [TransformationData].
  TransformationData density(
    int? density,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (density != null) {
      values['d'] = density.toString();
    }

    return TransformationData(plugin: 't', name: 'density', values: values);
  }
}

/// Mode options: overlay, underlay, wrap
enum Mode {
  overlay('overlay'),

  underlay('underlay'),

  wrap('wrap');

  final String value;

  const Mode(this.value);
}

/// Gravity options: northwest, north, northeast, east, center, west, southwest, south, southeast, custom
enum Gravity {
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

  const Gravity(this.value);
}

/// Blend options: over, in, out, atop, dest, dest-over, dest-in, dest-out, dest-atop, xor, add, saturate, multiply, screen, overlay, darken, lighten, colour-dodge, color-dodge, colour-burn, color-burn, hard-light, soft-light, difference, exclusion
enum Blend {
  over('over'),

  inp('in'),

  out('out'),

  atop('atop'),

  dest('dest'),

  dest_over('dest-over'),

  dest_inp('dest-in'),

  dest_out('dest-out'),

  dest_atop('dest-atop'),

  xor('xor'),

  add('add'),

  saturate('saturate'),

  multiply('multiply'),

  screen('screen'),

  overlay('overlay'),

  darken('darken'),

  lighten('lighten'),

  colour_dodge('colour-dodge'),

  color_dodge('color-dodge'),

  colour_burn('colour-burn'),

  color_burn('color-burn'),

  hard_light('hard-light'),

  soft_light('soft-light'),

  difference('difference'),

  exclusion('exclusion');

  final String value;

  const Blend(this.value);
}

class Merge {
  /// Method for Basic Transformations
  ///
  /// - [mode] : mode (Default: overlay)
  ///
  /// - [image] : image (Default: )
  ///
  /// - [transformation] : transformation (Default: )
  ///
  /// - [background] : background (Default: "00000000")
  ///
  /// - [height] : height (Default: 0)
  ///
  /// - [width] : width (Default: 0)
  ///
  /// - [top] : top (Default: 0)
  ///
  /// - [left] : left (Default: 0)
  ///
  /// - [gravity] : gravity (Default: center)
  ///
  /// - [blend] : blend (Default: over)
  ///
  /// - [tile] : tile (Default: false)
  ///
  /// - [listofbboxes] : List of bboxes (Default: )
  ///
  /// - [listofpolygons] : List of Polygons (Default: )
  ///
  /// Returns [TransformationData].
  TransformationData merge(
    Mode? mode,
    String? image,
    String? transformation,
    String? background,
    int? height,
    int? width,
    int? top,
    int? left,
    Gravity? gravity,
    Blend? blend,
    bool? tile,
    String? listofbboxes,
    String? listofpolygons,
  ) {
    // Determine if there are values to add to the dictionary

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

    if (listofbboxes != null) {
      values['bboxes'] = listofbboxes.toString();
    }

    if (listofpolygons != null) {
      values['polys'] = listofpolygons.toString();
    }

    return TransformationData(plugin: 't', name: 'merge', values: values);
  }
}
