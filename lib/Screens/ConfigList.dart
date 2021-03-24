import 'package:flutter/widgets.dart';
import 'package:statecontroll/Models/App.dart';
import 'package:statecontroll/Models/Config.dart';
import 'package:statecontroll/Network/Network.dart';
import 'package:statecontroll/Widgets/BoolConfigWidget.dart';
import 'package:statecontroll/Widgets/IntConfigWidget.dart';
import 'package:statecontroll/Widgets/TextConfigWidget.dart';
import 'package:ui_factory/Cofigurator.dart';
import 'package:ui_factory/Fabrics/IFabric.dart';

class ConfigList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final App app = ModalRoute.of(context)!.settings.arguments as App? ??
        App("", device: "", sessionId: "");
    final IFabric fabric = Configurator().getFabric();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        fabric.getText(
          app.name + "\n Устройство: " + app.device,
          fontWeight: FontWeight.w700,
          outMargin: EdgeInsets.only(bottom: 15),
        ),
        fabric.getLoadingPage<Config?>(
          loader: Network().networkConfig.getConfigs(app),
          content: (Config? response) {
            return Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: response!.config.length,
                itemBuilder: (context, index) {
                  switch (response.config[index].type) {
                    case DataTypes.Bool:
                      return BoolConfig(response, index);
                    case DataTypes.List:
                      return BoolConfig(response, index);
                    case DataTypes.Text:
                      return TextConfig(response, index);
                    case DataTypes.Num:
                      return IntConfig(response, index);
                    default:
                      return Configurator().getFabric().getText("Не удалось получить конфигурацию приложения");
                  }
                },
              ),
            );
          },
        )
      ],
    );
  }
}
