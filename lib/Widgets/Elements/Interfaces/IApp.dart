import 'package:flutter/widgets.dart';

abstract class IApp extends StatelessWidget {
  final Color? primaryColor;
  final Color? backgroundColor;
  final Color? buttonColor;
  final Map<String, Widget Function(BuildContext)> routes;

  const IApp({
    Key? key,
    required this.routes,
    this.primaryColor,
    this.backgroundColor,
    this.buttonColor,
  }) : super(key: key);
}
