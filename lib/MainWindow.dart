import 'package:flutter/widgets.dart';
import 'package:statecontroll/Widgets/Cofigurator.dart';
import 'package:statecontroll/Widgets/Fabrics/IFabric.dart';

class MainWindow extends StatelessWidget {
  final IFabric fabric = Configurator().getFabric();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        fabric.getText(
          "Поиск желаемой рабочей станции",
          textSize: 20,
          fontWeight: FontWeight.bold,
          outMargin: EdgeInsets.only(bottom: 15),
        ),
        fabric.getButton(
          content: "По подключенному лаунчеру",
          onPressed: null,
          outMargin: EdgeInsets.symmetric(vertical: 5),
        ),
        fabric.getButton(
          content: "По подключенному приложению",
          onPressed: () {
            Navigator.pushNamed(context, "/apps");
          },
          outMargin: EdgeInsets.symmetric(vertical: 5),
        )
      ],
    );
  }
}
