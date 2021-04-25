import 'package:mockito/mockito.dart';
import 'package:statecontroll/Models/App.dart';
import 'package:statecontroll/Models/Config.dart';

class MockNetworkApp extends Mock {
  static final MockNetworkApp _instance = new MockNetworkApp._internal();

  factory MockNetworkApp() {
    return _instance;
  }

  MockNetworkApp._internal();

  Future<List<App>> getApps() => Future.delayed(
        Duration(seconds: 1),
        () {
          return [
            App("Wolf and Eggs", device: "Rog 1", sessionId: "", tags: {AppType.Statefull}),
            App("IT TV", device: "Rog 2", sessionId: "", tags: {AppType.Configured}),
            App("Somthing New", device: "Quest 1", sessionId: "", tags: {AppType.Statefull, AppType.Configured}),
          ];
        },
      );

  Future<List<String>> getAppStates(String appNme) => Future.delayed(
        Duration(seconds: 1),
        () {
          return [
            "Задача 1",
            "Задача 2",
            "Задача 3",
          ];
        },
      );

  Future<Config> getAppConfig() => Future.delayed(
        Duration(seconds: 1),
        () {
          return new Config(
            "sessionID",
            [
              ConfigElement(
                "bool",
                DataTypes.Bool,
                "true",
              ),
              ConfigElement(
                "int",
                DataTypes.Num,
                "50",
              ),
              ConfigElement(
                "name",
                DataTypes.List,
                "[\"element1\", \"element2\", \"element3\"]",
              ),
              ConfigElement(
                "name",
                DataTypes.Text,
                "some text",
              ),
            ],
          );
        },
      );
}
