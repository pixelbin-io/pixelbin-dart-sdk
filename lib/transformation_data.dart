class TransformationData {
  final String plugin;
  final String name;
  final Map<String, dynamic> values;

  TransformationData(
      {required this.plugin, required this.name, Map<String, dynamic>? values})
      : values = values ?? {};

  String encode() {
    final parametersString =
        values.entries.map((entry) => "${entry.key}:${entry.value}").join(",");
    if (parametersString.isEmpty) {
      return "$plugin.$name()";
    } else {
      return "$plugin.$name($parametersString)";
    }
  }

  static List<TransformationData> decode(String encodedString) {
    var transformations = <TransformationData>[];
    var transformationStrings = encodedString.split("~");
    for (var transformationString in transformationStrings) {
      var mainComponents = transformationString.split(RegExp(r"\("));
      if (mainComponents.length != 2) continue;
      var pluginAndName = mainComponents[0].split(".");
      if (pluginAndName.length != 2) continue;
      var plugin = pluginAndName[0];
      var name = pluginAndName[1];
      var values = <String, dynamic>{};
      var parametersPart =
          mainComponents[1].substring(0, mainComponents[1].length - 1);
      var parameterPairs = parametersPart.split(",");
      for (var pair in parameterPairs) {
        var keyValue = pair.split(":");
        if (keyValue.length == 2) {
          values[keyValue[0]] = keyValue[1];
        }
      }
      transformations
          .add(TransformationData(plugin: plugin, name: name, values: values));
    }
    return transformations;
  }
}

extension TransformationDataListExtension on List<TransformationData> {
  String encode() {
    return map((item) => item.encode()).join("~");
  }
}

extension StringTransformationDataExtension on String {
  List<TransformationData> decodeTransformationData() {
    return TransformationData.decode(this);
  }

  bool hasTransformation() {
    var pattern =
        RegExp(r"([a-z]+\.[a-z]+\([^)]*\)(~[a-z]+\.[a-z]+\([^)]*\))*)");
    return pattern.hasMatch(this);
  }
}
