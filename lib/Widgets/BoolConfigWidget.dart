import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:statecontroll/Models/Config.dart';
import 'package:statecontroll/Network/Network.dart';
import 'package:statecontroll/Widgets/ConfigWidget.dart';
import 'package:ui_factory/Cofigurator.dart';
import 'package:ui_factory/Fabrics/IFabric.dart';

class BoolConfig extends StatefulWidget {
  final Config configs;
  final int index;
  final IFabric fabric = Configurator().getFabric();

  BoolConfig(this.configs, this.index);

  @override
  _BoolConfigState createState() => _BoolConfigState();
}

class _BoolConfigState extends State<BoolConfig> {
  @override
  Widget build(BuildContext context) {
    ConfigElement element = widget.configs.config[widget.index];

    return ConfigWidget(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: widget.fabric.getText(
              element.name,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.bold,
              outMargin: EdgeInsets.all(5),
            ),
          ),
          Switch(
            value: element.value.toLowerCase() == "true",
            onChanged: (value) {
              setState(() {
                element.value = value.toString();
              });

              Network().networkConfig.sendConfig(widget.configs);
            },
          ),
        ],
      ),
    );
  }
}
