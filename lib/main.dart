import 'package:flutter/widgets.dart';
import 'package:statecontroll/AppList.dart';
import 'package:statecontroll/ControllList.dart';

import 'Widgets/Cofigurator.dart';
import 'Widgets/Fabrics/IFabric.dart';
import 'MainWindow.dart';

void main() {
  IFabric fabric = Configurator().getFabric();

  runApp(
    fabric.getApp(
      routes: {
        "/": (context) =>
            fabric.getWindow(title: "StateControll", child: MainWindow()),
        "/apps": (context) => fabric.getWindow(title: "Запущенные приложения", child: AppList()),
        "/controll": (context) => fabric.getWindow(title: "Управление приложением", child: ControllList()),
      },
      primaryColor: Color.fromARGB(255, 253, 119, 82),
      backgroundColor: Color.fromARGB(255, 31, 21, 37),
      buttonColor: Color.fromARGB(255, 150, 169, 197),
    ),
  );
}
