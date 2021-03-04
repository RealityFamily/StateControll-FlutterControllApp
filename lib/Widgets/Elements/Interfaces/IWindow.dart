import 'package:flutter/widgets.dart';

abstract class IWindow extends StatelessWidget {
  final String? title;
  final Widget child;

  IWindow({
    Key? key,
    String? title,
    required this.child,
  })   : this.title = title ?? "",
        super(key: key);
}