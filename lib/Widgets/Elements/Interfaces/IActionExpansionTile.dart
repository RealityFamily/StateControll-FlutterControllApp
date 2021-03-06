import 'package:flutter/widgets.dart';

abstract class IActionExpansionTile extends StatelessWidget {
  final String title;
  final Map<String, VoidCallback?>? childrens;
  final EdgeInsets? outMargin;

  const IActionExpansionTile(
    this.title, {
    Key? key,
    this.childrens,
    this.outMargin
  }) : super(key: key);
}
