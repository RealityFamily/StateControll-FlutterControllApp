import 'package:mockito/mockito.dart';
import 'package:statecontroll/Models/App.dart';

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
            App("Wolf and Eggs", device: "Rog 1"),
            App("IT TV", device: "Rog 2"),
            App("Somthing New", device: "Quest 1"),
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
}
