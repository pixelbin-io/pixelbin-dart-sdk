import '../transformation_data.dart';

class WmRemove {
  /// Method for Watermark Removal Plugin
  /// - [removeText] : Remove Text (Default: false)
  /// - [removeLogo] : Remove Logo (Default: false)
  /// - [box1] : Box 1 (Default: "0_0_100_100")
  /// - [box2] : Box 2 (Default: "0_0_0_0")
  /// - [box3] : Box 3 (Default: "0_0_0_0")
  /// - [box4] : Box 4 (Default: "0_0_0_0")
  /// - [box5] : Box 5 (Default: "0_0_0_0")
  /// Returns [TransformationData].
  TransformationData remove(
    bool? removeText,
    bool? removeLogo,
    String? box1,
    String? box2,
    String? box3,
    String? box4,
    String? box5,
  ) {
    var values = <String, String>{};
    if (removeText != null) {
      values['rem_text'] = removeText.toString();
    }
    if (removeLogo != null) {
      values['rem_logo'] = removeLogo.toString();
    }
    if (box1 != null && box1.isNotEmpty) {
      values['box1'] = box1;
    }
    if (box2 != null && box2.isNotEmpty) {
      values['box2'] = box2;
    }
    if (box3 != null && box3.isNotEmpty) {
      values['box3'] = box3;
    }
    if (box4 != null && box4.isNotEmpty) {
      values['box4'] = box4;
    }
    if (box5 != null && box5.isNotEmpty) {
      values['box5'] = box5;
    }
    return TransformationData(plugin: 'wm', name: 'remove', values: values);
  }
}
