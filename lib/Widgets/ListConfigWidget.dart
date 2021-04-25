import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:statecontroll/Models/Config.dart';
import 'package:statecontroll/Network/Network.dart';
import 'package:ui_factory/Cofigurator.dart';
import 'package:ui_factory/Fabrics/IFabric.dart';

import 'ConfigWidget.dart';

class IntConfig extends StatefulWidget {
  final Config configs;
  final int index;
  final IFabric fabric = Configurator().getFabric();

  IntConfig(this.configs, this.index);

  @override
  _IntConfigState createState() => _IntConfigState();
}

class _IntConfigState extends State<IntConfig> {
  @override
  Widget build(BuildContext context) {
    ConfigElement element = widget.configs.config[widget.index];

    return ConfigWidget(
      content: Column(
        children: [
          widget.fabric.getText(
            element.name,
            textAlign: TextAlign.start,
            outMargin: EdgeInsets.all(5),
            fontWeight: FontWeight.bold,
          ),
          Row(
            children: [
              Slider(
                value: double.parse(element.value),
                onChanged: (value) {
                  element.value = value.toString();

                  print(widget.configs);

                  Network().networkConfig.sendConfig(widget.configs);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
