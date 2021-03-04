import 'package:flutter/material.dart';

abstract class IText extends StatelessWidget {
  
  final String data;
  final double? textSize;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;
  final EdgeInsets? outMargin;

  IText(
    this.data, {
    Key? key,
    double? textSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Color? color,
    this.outMargin,
  })  : this.textSize = textSize ?? 16,
        this.fontStyle = fontStyle ?? FontStyle.normal,
        this.fontWeight = fontWeight ?? FontWeight.normal,
        this.textAlign = textAlign ?? TextAlign.center,
        this.color = color,
        super(key: key);
}