import 'package:flutter/widgets.dart';

abstract class IButton extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final EdgeInsets? outMargin;

  IButton({
    Key? key,
    required this.content,
    required this.onPressed,
    this.outMargin
  }) : super(key: key);
}