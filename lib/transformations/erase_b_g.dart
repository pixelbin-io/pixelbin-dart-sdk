import '../transformation_data.dart';

/// Foreground type options: general, ecommerce, car, human, object
enum Foregroundtype {
  general('general'),

  ecommerce('ecommerce'),

  car('car'),

  human('human'),

  object('object');

  final String value;

  const Foregroundtype(this.value);
}

class EraseBG {
  /// Method for EraseBG Background Removal Module
  /// @param Foreground Type Foreground type? (Default: general)
  /// @param Add Shadow bool (Default: false)
  /// @param Refine bool (Default: true)
  /// @return TransformationData.
  TransformationData bg(
    Foregroundtype? foregroundptype,
    bool? addshadow,
    bool? refinpe,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (foregroundptype != null) {
      values['i'] = foregroundptype.value;
    }

    if (addshadow != null) {
      values['shadow'] = addshadow.toString();
    }

    if (refinpe != null) {
      values['r'] = refinpe.toString();
    }

    return TransformationData(plugin: 'erase', name: 'bg', values: values);
  }
}
