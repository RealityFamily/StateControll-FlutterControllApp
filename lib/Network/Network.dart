import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:statecontroll/Mock/MockNetworkApp.dart';
import 'package:statecontroll/Models/App.dart';
import 'package:statecontroll/Models/Config.dart';
import 'package:dio/dio.dart';

class Network {
  static final Network _instance = new Network._internal();

  factory Network() {
    return _instance;
  }

  Network._internal();

  // String getJSON(Response response) {
  //   return utf8.decode(response.bodyBytes);
  // }

  String baseURL = "http://localhost:8080";
  _NetworkApp networkApp = new _NetworkApp();
  _NetworkConfig networkConfig = new _NetworkConfig();
  _NetworkStates networkStates = new _NetworkStates();
}


class _NetworkApp {
  Future<List<App>> getApps() async {
    List<App> answer = [];

    var client = Dio();
    try {
      var configResponse = await client
          .get<List<dynamic>>(Network().baseURL + "/configs/api/control/apps")
          .timeout(
            Duration(seconds: 3),
          );

      if (configResponse.statusCode == 200) {
        List<App> configAnswer =
            //getConfiguredAppsListFromJSON(Network().getJSON(configResponse));
            configResponse.data.map((map) => App.fromJSON(map, {AppType.Configured})).toList();
        configAnswer.forEach(
          (app) {
            if (answer.contains(app)) {
              answer
                  .firstWhere((element) =>
                      element.name == app.name && element.device == app.device)
                  .tags!
                  .addAll(app.tags!);
            } else {
              answer.add(app);
            }
          },
        );
      } else {
        print("Произошла ошибка при загрузке кофигурируемых приложений");
      }

      var stateResponse = await client
          .get<List<dynamic>>(Network().baseURL + "/configs/api/control/apps")
          .timeout(
            Duration(seconds: 3),
          );

      if (stateResponse.statusCode == 200) {
        List<App> statefullAnswer =
            //getStatefullAppsListFromJSON(Network().getJSON(configResponse));
            stateResponse.data.map((map) => App.fromJSON(map, {AppType.Statefull})).toList();
        statefullAnswer.forEach(
          (app) {
            if (answer.contains(app)) {
              answer
                  .firstWhere((element) =>
                      element.name == app.name && element.device == app.device)
                  .tags!
                  .addAll(app.tags!);
            } else {
              answer.add(app);
            }
          },
        );
      } else {
        print("Произошла ошибка при загрузке приложений со состояниями");
      }

      if (answer.isNotEmpty) {
        return answer;
      } else if (kDebugMode && answer.isEmpty) {
        return MockNetworkApp().getApps();
      } else {
        return [];
      }
    } catch (e) {
      print("From NettworkApp: \t ${e}");
      if (answer.length > 0) {
        return answer;
      } else if (kDebugMode && answer.length == 0) {
        return MockNetworkApp().getApps();
      }
      return [];
    }
  }
}


class _NetworkConfig {
  Future<Config?> getConfigs(App app) async {
    var client = Dio();
    try {
      var response =
          await client.get<String>(Network().baseURL + "/configs/api/control/${app.sessionId}/config").timeout(
                Duration(seconds: 3),
              );

              if (response.statusCode == 200) {
                var json = jsonDecode(response.data);
                List<ConfigElement> configElements = json.map((e) {return ConfigElement.fromJSON(e); }).toList().cast<ConfigElement>();
                return Config(app.sessionId, configElements);
              } else {
                return null;
              }
    } catch (e) {
      print("From NettworkConfig: \t $e");
      if (kDebugMode) {
        return MockNetworkApp().getAppConfig();
      }
      return null;
    }
  }

  Future<void> sendConfig(Config configs) async {
    var client = Dio();
    try {
      var response = await client
          .post(Network().baseURL + "/configs/api/control/${configs.sessionId}/newConfig", data: configs.config)
          .timeout(
            Duration(seconds: 3),
          );

      if (response.statusCode == 200) {
        print("Конфигурация отправлена успешно на устройство ${configs.sessionId}.");
      } else if (kDebugMode) {
        print("Конфигурация отправлена успешно на устройство ${configs.sessionId} в режиме отладки.");
      } else {
        print("Произошла ошибка при отправке конфигурации на устройство ${configs.sessionId}");
      }
    } catch (e) {
      print("From NettworkConfig: \t $e");
      if (kDebugMode) {
        print("Конфигурация отправлена успешно на устройство ${configs.sessionId} в режиме отладки.");
      }
    }
  }
}

class _NetworkStates {
  Future<List<String>> getAppStates(String appName) async {
    var client = Dio();
    try {
      var response =
          await client.get<List<String>>(Network().baseURL + "/api/control/games").timeout(
                Duration(seconds: 3),
              );

      if (response.statusCode == 200) {
        return 
          //(Network().getJSON(response) as List<dynamic>).cast<String>();
          response.data;
      } else if (kDebugMode) {
        return MockNetworkApp().getAppStates(appName);
      } else {
        print("Произошла ошибка при загрузке приложений");
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        return MockNetworkApp().getAppStates(appName);
      }
      print("From NettworkStates: \t ${e}");
      return [];
    }
  }

  Future<void> sendState(String appName, String state) async {
    var client = Dio();
    try {
      var response = await client
          .post(Network().baseURL + "/api/control/apps", data: state)
          .timeout(
            Duration(seconds: 3),
          );

      if (response.statusCode == 200) {
        print("Состояние $state отправлено успешно.");
      } else if (kDebugMode) {
        print("Состояние $state отправлено успешно в режиме отладки.");
      } else {
        print("Произошла ошибка при отправке состояния $state игры $appName");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Состояние $state отправлено успешно в режиме отладки.");
      } else {
        print("From NettworkStates: \t $e");
      }
    }
  }
}