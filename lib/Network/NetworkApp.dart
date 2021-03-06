import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:statecontroll/Mock/MockNetworkApp.dart';
import 'package:statecontroll/Models/App.dart';

class NetworkApp {
  static final NetworkApp _instance = new NetworkApp._internal();

  factory NetworkApp() {
    return _instance;
  }

  NetworkApp._internal();

  String _getJSON(http.Response response) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  String baseURL = "10.0.2.2";

  Future<List<App>> getApps() async {
    var client = http.Client();
    try {
      var response =
          await client.get(Uri.http(baseURL, "/api/control/games")).timeout(
                Duration(seconds: 3),
              );

      if (response.statusCode == 200) {
        return getAppsListFromJSON(_getJSON(response));
      } else if (kDebugMode) {
        return MockNetworkApp().getApps();
      } else {
        print("Произошла ошибка при загрузке приложений");
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        return MockNetworkApp().getApps();
      }
      print("From NettworkApp: \t ${e}");
      return [];
    }
  }

  Future<List<String>> getAppStates(String appName) async {
    var client = http.Client();
    try {
      var response =
          await client.get(Uri.http(baseURL, "/api/control/games")).timeout(
                Duration(seconds: 3),
              );

      if (response.statusCode == 200) {
        return (_getJSON(response) as List<dynamic>).cast<String>();
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
      print("From NettworkApp: \t ${e}");
      return [];
    }
  }

  Future<void> sendState(String appName, String state) async {
    var client = http.Client();
    try {
      var response = await client
          .post(Uri.http(baseURL, "/api/control/games"), body: state)
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
        print("From NettworkApp: \t $e");
      }
    }
  }
}
