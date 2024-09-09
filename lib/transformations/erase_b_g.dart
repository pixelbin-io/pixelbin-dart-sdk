import '../transformation_data.dart';

/// Foreground Type options: general, ecommerce, car, human, object
enum EraseIndustryType {
  general('general'),

  ecommerce('ecommerce'),

  car('car'),

  human('human'),

  object('object');

  final String value;

  const EraseIndustryType(this.value);
}

class EraseBg {
  /// Method for EraseBG Background Removal Module
  ///
  ///
  /// - [industryType] : EraseIndustryType (Default: general)
  ///
  ///
  ///
  /// - [addShadow] : Add Shadow (Default: false)
  ///
  ///
  ///
  /// - [refine] : Refine (Default: true)
  ///
  ///
  /// Returns [TransformationData].
  TransformationData bg(
    EraseIndustryType? industryType,
    bool? addShadow,
    bool? refine,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (industryType != null) {
      values['i'] = industryType.value;
    }

    if (addShadow != null) {
      values['shadow'] = addShadow.toString();
    }

    if (refine != null) {
      values['r'] = refine.toString();
    }

    return TransformationData(plugin: 'erase', name: 'bg', values: values);
  }
}
