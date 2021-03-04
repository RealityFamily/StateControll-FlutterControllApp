import 'package:flutter/material.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IWindow.dart';

class WebWindow extends IWindow {
  WebWindow({
    Key? key,
    String? title,
    required Widget child,
  }) : super(
          key: key,
          child: child,
          title: title,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Card(
          color: Theme.of(context).primaryColor,
          child: Container(
            child: child,
            margin: EdgeInsets.all(30),
            width: MediaQuery.of(context).size.width * 0.75,
          ),
        ),
      ),
    );
  }
}
