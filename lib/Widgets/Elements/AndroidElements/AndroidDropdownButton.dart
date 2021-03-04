import 'package:flutter/material.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IDropdownButton.dart';

class AndroidDropdownButton<T> extends IDropdownButton<T> {
  AndroidDropdownButton({
    Key? key,
    required T value,
    required ValueChanged<T?> onChanged,
    int? flexKoef,
    required List<DropdownMenuItem<T>> items,
  }) : super(
          key: key,
          value: value,
          onChanged: onChanged,
          flexKoef: flexKoef,
          items: items,
        );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: (flexKoef)!,
      child: DropdownButton<T>(
        value: value,
        onChanged: onChanged,
        items: items,
      ),
    );
  }
}
