import 'package:flutter/widgets.dart';
import 'package:statecontroll/Network/Network.dart';
import 'package:ui_factory/Cofigurator.dart';
import 'package:ui_factory/Fabrics/IFabric.dart';

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
      loader: Network().networkApp.getApps(),
      content: (List<App>? response) {
        return Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: response!.length,
            itemBuilder: (context, index) {
              Map<String, void Function()?> actions = {};

              if (response[index].tags != null) {
                response[index].tags!.forEach((element) {
                  switch (element) {
                    case AppType.Configured:
                      actions["Конфигурация"] = () {
                        Navigator.pushNamed(context, "/config",
                            arguments: response[index]);
                      };
                      break;
                    case AppType.Statefull:
                      actions["Управлять"] = () {
                        Navigator.pushNamed(context, "/state",
                            arguments: response[index]);
                      };
                      break;
                  }
                });
              }

              return fabric.getActionExpansionTile(
                response[index].name +
                    "\n Устройство: " +
                    response[index].device,
                outMargin: EdgeInsets.all(5),
                childrens: actions,
              );
            },
          ),
        );
      },
    );
  }
}
