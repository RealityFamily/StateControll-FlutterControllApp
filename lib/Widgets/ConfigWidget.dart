import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfigWidget extends StatelessWidget {
  final Widget content;
  final EdgeInsets outMargin;

  ConfigWidget(
      {required this.content,
      this.outMargin =
          const EdgeInsets.symmetric(vertical: 5, horizontal: 10)});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: outMargin,
      child: content,
    );
  }
}
