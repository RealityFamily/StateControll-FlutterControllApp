import 'package:flutter/widgets.dart';

abstract class ITextField extends StatefulWidget {
  final ValueChanged<String> onSubmited;
  final double? textSize;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final int? flexKoef;
  final EdgeInsets? outMargin;

  ITextField({
    Key? key,
    required this.onSubmited,
    double? textSize,
    this.controller,
    this.textInputType,
    int? flexKoef,
    this.outMargin,
  })  : this.textSize = textSize ?? 16,
        this.flexKoef = flexKoef ?? 1,
        super(key: key);
}