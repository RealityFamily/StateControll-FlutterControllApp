import 'dart:convert';

List<Config> getConfigListFromJSON(String str) =>
    List<Config>.from(json.decode(str).map((temp) => Config.fromJSON(temp)));

List<ConfigElement> getConfigElementListFromJSON(String str) =>
    List<ConfigElement>.from(
        json.decode(str).map((temp) => ConfigElement.fromJSON(temp)));

class Config {
  String sessionId;
  List<ConfigElement> config;

  Config(this.sessionId, this.config);

  @override
  String toString() {
    return "sessionId: " + sessionId + "\nconfigs: " + config.toString();
  }

  factory Config.fromJSON(Map<String, dynamic> json) => Config(
        json["sessionId"],
        json["config"],
      );
  factory Config.fromStringJSON(String sessionId, String inJson) {
    List<dynamic> listJson = json.decode(inJson);
    List<ConfigElement> configs =
        listJson.map((e) => ConfigElement.fromJSON(e)).toList();

    return Config(
      sessionId,
      configs,
    );
  }
}

enum DataTypes {
  Bool,
  List,
  Text,
  Num,
}

class ConfigElement {
  String name;
  dynamic value;
  DataTypes type;

  ConfigElement(this.name, this.type, this.value);

  @override
  String toString() {
    return "name: " + name + "\nvalue: " + value + "\ntype: " + type.toString();
  }

  factory ConfigElement.fromJSON(Map<String, dynamic> json) {
    switch (json["type"]) {
      case "Bool":
        return ConfigElement(
          json["name"],
          DataTypes.Bool,
          json["value"].toString(),
        );
      case "List":
        return ConfigElement(
          json["name"],
          DataTypes.List,
          json["value"].toString(),
        );
      case "Text":
        return ConfigElement(
          json["name"],
          DataTypes.Text,
          json["value"].toString(),
        );
      case "Num":
        return ConfigElement(
          json["name"],
          DataTypes.Num,
          json["value"].toString(),
        );
      default:
        throw "No such type in containing as ${json["type"]}";
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "name" : name,
      "value" : value,
      "type" : type.toString().substring(type.toString().indexOf('.') + 1),
    };
  }
}
