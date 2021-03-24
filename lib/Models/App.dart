import 'dart:convert';

List<App> getConfiguredAppsListFromJSON(String str) =>
    List<App>.from(json.decode(str).map((temp) => App.fromJSON(temp, {AppType.Configured})));

List<App> getStatefullAppsListFromJSON(String str) =>
    List<App>.from(json.decode(str).map((temp) => App.fromJSON(temp, {AppType.Statefull})));

enum AppType{
    Configured,
    Statefull
}

class App {
  String name;
  String device;
  String sessionId;
  Set<AppType>? tags;

  App(this.name, {required this.device, required this.sessionId, this.tags});

  // ignore: hash_and_equals
  bool operator ==(Object other) {
    return other is App && other.name == this.name && other.device == this.device;
  }

  factory App.fromJSON(Map<String, dynamic> json, Set<AppType>? tags) => App(
        json["name"],
        device: json["deviceName"],
        sessionId: json["sessionId"],
        tags: tags,
      );

}
