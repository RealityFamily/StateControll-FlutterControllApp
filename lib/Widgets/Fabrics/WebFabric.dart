import 'package:flutter/material.dart';
import 'package:statecontroll/Widgets/Elements/AllPlatforms/LoadingPage.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IApp.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IButton.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IDropdownButton.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IActionExpansionTile.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/ILoadingPage.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IText.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/ITextField.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IWindow.dart';
import 'package:statecontroll/Widgets/Elements/WebElements/WebAltText.dart';
import 'package:statecontroll/Widgets/Elements/WebElements/WebApp.dart';
import 'package:statecontroll/Widgets/Elements/WebElements/WebButton.dart';
import 'package:statecontroll/Widgets/Elements/WebElements/WebDropdownButton.dart';
import 'package:statecontroll/Widgets/Elements/WebElements/WebExpansionTile.dart';
import 'package:statecontroll/Widgets/Elements/WebElements/WebText.dart';
import 'package:statecontroll/Widgets/Elements/WebElements/WebTextField.dart';
import 'package:statecontroll/Widgets/Elements/WebElements/WebWindow.dart';

import 'IFabric.dart';

class WebFabric extends IFabric {
  @override
  IApp getApp({
    required Map<String, Widget Function(BuildContext)> routes,
    Color? primaryColor,
    Color? backgroundColor,
    Color? buttonColor,
  }) {
    return WebApp(
      routes: routes,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      buttonColor: buttonColor,
    );
  }

  @override
  IButton getButton({
    Key? key,
    required String content,
    required onPressed,
    EdgeInsets? outMargin,
  }) {
    return WebButton(
      content: content,
      onPressed: onPressed,
      outMargin: outMargin,
      key: key,
    );
  }

  @override
  IText getText(
    String data, {
    double? textSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Color? color,
    EdgeInsets? outMargin,
  }) {
    return WebText(
      data,
      textSize: textSize,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      textAlign: textAlign,
      color: color,
      outMargin: outMargin,
    );
  }

  @override
  IText getAltText(
    String data, {
    double? textSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Color? color,
    EdgeInsets? outMargin,
  }) {
    return WebAltText(
      data,
      textSize: textSize,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      textAlign: textAlign,
      color: color,
      outMargin: outMargin,
    );
  }

  @override
  IWindow getWindow({
    Key? key,
    String? title,
    required Widget child,
  }) {
    return WebWindow(
      child: child,
      title: title,
      key: key,
    );
  }

  @override
  ITextField getTextField({
    Key? key,
    required onSubmited,
    double? textSize,
    TextInputType? textInputType,
    TextEditingController? controller,
    int? flexKoef,
    EdgeInsets? outMargin,
  }) {
    return WebTextField(
      key: key,
      onSubmited: onSubmited,
      textSize: textSize,
      textInputType: textInputType,
      controller: controller,
      flexKoef: flexKoef,
      outMargin: outMargin,
    );
  }

  @override
  IDropdownButton<T> getDropdownButton<T>({
    Key? key,
    required T value,
    required onChanged,
    int? flexKoef,
    required List<DropdownMenuItem<T>> items,
  }) {
    return WebDropdownButton(
      items: items,
      value: value,
      key: key,
      flexKoef: flexKoef,
      onChanged: onChanged,
    );
  }

  @override
  ILoadingPage<T> getLoadingPage<T>({
    required Future<T> loader,
    required Widget Function(T? response) content,
  }) {
    return LoadingPage(
      loader: loader,
      content: content,
    );
  }

  @override
  IActionExpansionTile getActionExpansionTile(
    String title, {
    Map<String, VoidCallback?>? childrens,
    EdgeInsets? outMargin
  }) {
    return WebExpansionTile(
      title,
      childrens: childrens,
      outMargin: outMargin,
    );
  }
}
