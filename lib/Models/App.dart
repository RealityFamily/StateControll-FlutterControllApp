import 'dart:convert';

List<App> getAppsListFromJSON(String str) =>
    List<App>.from(json.decode(str).map((temp) => App.fromJSON(temp)));

class App {
  String name;
  String device;
  List<String>? tags;

  App(this.name, {required this.device, this.tags});

  factory App.fromJSON(Map<String, dynamic> json) => App(
        json["name"],
        device: json["device"],
        tags: json["tags"],
      );
}
