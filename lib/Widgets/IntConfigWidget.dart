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
    TextEditingController controller =
        TextEditingController(text: element.value);

    double maxValue = 1;
    if (element.name.contains("Volume") || element.name.contains("volume")) {
      maxValue = 100;
    } else if (element.name.contains("Min") || element.name.contains("min")) {
      maxValue = 60;
    } else if (element.name.contains("Hour") || element.name.contains("hour")) {
      maxValue = 24;
    } else {
      maxValue = 100;
    }

    return ConfigWidget(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.fabric.getText(
            element.name,
            textAlign: TextAlign.start,
            outMargin: EdgeInsets.all(5),
            fontWeight: FontWeight.bold,
          ),
          Row(
            children: [
              Expanded(
                child: Slider(
                  min: 0,
                  max: maxValue,
                  value: double.parse(element.value),
                  onChanged: (value) {
                    setState(() {
                      element.value = value.toStringAsFixed(3);
                    });

                    print(widget.configs.toString() + "\n");

                    Network().networkConfig.sendConfig(widget.configs);
                  },
                ),
              ),
              Container(
                width: 60,
                child: widget.fabric.getTextField(
                  controller: controller,
                  onSubmited: (String value) {
                    setState(() {
                      element.value = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
