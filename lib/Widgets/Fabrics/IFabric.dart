import 'package:flutter/material.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IApp.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IButton.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IDropdownButton.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IActionExpansionTile.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/ILoadingPage.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IText.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/ITextField.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IWindow.dart';

abstract class IFabric {
  /// Метод, возвращающий виджет приложения под запускаемую ОС.
  ///  
  /// * `routes` указывается ассоциативный массив [Map<String, (context) => Widget>] всех ссылок приложения.
  /// 
  /// * `primatyColor` указывается основной цвет приложения, используемый для всех карт с данными.
  ///
  /// * `backgroundColor` указывается цвет для заднего фона приложения.
  ///
  /// * `buttonColor` указывается цвет для всех клавиш внутри приложения.
  IApp getApp({
    required Map<String, Widget Function(BuildContext)> routes,
    Color? primaryColor,
    Color? backgroundColor,
    Color? buttonColor,
  });

  IWindow getWindow({
    Key? key,
    String? title,
    required Widget child,
  });

  IText getText(
    String data, {
    double? textSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Color? color,
    EdgeInsets? outMargin,
  });

  IText getAltText(
    String data, {
    double? textSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Color? color,
    EdgeInsets? outMargin,
  });

  IButton getButton({
    Key? key,
    required String content,
    required VoidCallback? onPressed,
    EdgeInsets? outMargin,
  });

  ITextField getTextField({
    Key? key,
    required ValueChanged<String> onSubmited,
    double? textSize,
    TextInputType? textInputType,
    TextEditingController? controller,
    int? flexKoef,
    EdgeInsets? outMargin,
  });

  IDropdownButton<T> getDropdownButton<T>({
    Key? key,
    required T value,
    required ValueChanged<T?> onChanged,
    int? flexKoef,
    required List<DropdownMenuItem<T>> items,
  });

  ILoadingPage<T> getLoadingPage<T>({
    required Future<T> loader,
    required Widget Function(T? response) content,
  });

  IActionExpansionTile getActionExpansionTile(
    String title, {
    Map<String, VoidCallback?>? childrens,
    EdgeInsets? outMargin,
  });
}
