import '../transformation_data.dart';

/// Foreground Type options: general, ecommerce, car, human, object
enum Industrytype {
  general('general'),

  ecommerce('ecommerce'),

  car('car'),

  human('human'),

  object('object');

  final String value;

  const Industrytype(this.value);
}

class EraseBG {
  /// Method for EraseBG Background Removal Module
  /// @param Industry Type Industry type? (Default: general)
  /// @param Add Shadow bool (Default: false)
  /// @param Refine bool (Default: true)
  /// @return TransformationData.
  TransformationData bg(
    Industrytype? industryptype,
    bool? addshadow,
    bool? refinpe,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (industryptype != null) {
      values['i'] = industryptype.value;
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
