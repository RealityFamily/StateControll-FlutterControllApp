import 'package:flutter/material.dart';
import 'package:statecontroll/Widgets/Elements/AndroidElements/AndroidText.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IWindow.dart';

class AndroidWindow extends IWindow {
  AndroidWindow({
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
      appBar: AppBar(
        title: AndroidText(
          title!,
          textSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Card(
          elevation: 0,
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
