import 'package:flutter/widgets.dart';
import 'package:statecontroll/Network/NetworkApp.dart';
import 'package:statecontroll/Widgets/Cofigurator.dart';
import 'package:statecontroll/Widgets/Fabrics/IFabric.dart';

import 'Models/App.dart';

class AppList extends StatefulWidget {
  @override
  _AppListState createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  IFabric fabric = Configurator().getFabric();

  @override
  Widget build(BuildContext context) {
    return fabric.getLoadingPage<List<App>>(
      loader: NetworkApp().getApps(),
      content: (List<App>? response) {
        return Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: response!.length,
            itemBuilder: (context, index) {
              return fabric.getActionExpansionTile(
                response[index].name +
                    "\n Устройство: " +
                    response[index].device,
                outMargin: EdgeInsets.all(5),
                childrens: {
                  "Конфигурация": () {},
                  "Управлять": () {
                    Navigator.pushNamed(context, "/controll",
                        arguments: response[index]);
                  },
                  "Завершить": () {}
                },
              );
            },
          ),
        );
      },
    );
  }
}
