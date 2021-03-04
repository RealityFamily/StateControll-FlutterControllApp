import 'package:flutter/material.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IApp.dart';

class AndroidApp extends IApp {
  AndroidApp({
    Key? key,
    required Map<String, Widget Function(BuildContext)> routes,
    Color? primaryColor,
    Color? backgroundColor,
    Color? buttonColor,
  }) : super(
          key: key,
          routes: routes,
          primaryColor: primaryColor,
          backgroundColor: backgroundColor,
          buttonColor: buttonColor,
        );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes,
      theme: ThemeData(
        primaryColor: primaryColor,
        backgroundColor: backgroundColor,
        buttonColor: buttonColor,
      ),
    );
  }
}
