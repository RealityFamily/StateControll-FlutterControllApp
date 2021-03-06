import 'package:flutter/widgets.dart';
import 'package:statecontroll/Models/App.dart';
import 'package:statecontroll/Network/Network.dart';
import 'package:ui_factory/Cofigurator.dart';
import 'package:ui_factory/Fabrics/IFabric.dart';

class StateList extends StatelessWidget {
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
        fabric.getLoadingPage<List<String>>(
          loader: Network().networkStates.getAppStates(app.name),
          content: (List<String>? response) {
            return Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: response!.length,
                itemBuilder: (context, index) {
                  return fabric.getButton(
                    content: response[index],
                    onPressed: () {
                      Network().networkStates.sendState(app.name, response[index]);
                    },
                    outMargin: EdgeInsets.symmetric(vertical: 5),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
