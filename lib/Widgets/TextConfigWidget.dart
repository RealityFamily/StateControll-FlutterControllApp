import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:statecontroll/Models/Config.dart';
import 'package:statecontroll/Network/Network.dart';
import 'package:ui_factory/Cofigurator.dart';
import 'package:ui_factory/Fabrics/IFabric.dart';

import 'ConfigWidget.dart';

class TextConfig extends StatefulWidget {
  final Config configs;
  final int index;
  final IFabric fabric = Configurator().getFabric();

  TextConfig(this.configs, this.index);

  @override
  _TextConfigState createState() => _TextConfigState();
}

class _TextConfigState extends State<TextConfig> {
  @override
  Widget build(BuildContext context) {
    ConfigElement element = widget.configs.config[widget.index];
    TextEditingController controller =
        TextEditingController(text: element.value);

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
              widget.fabric.getTextField(
                controller: controller,
                onSubmited: (value) {
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
