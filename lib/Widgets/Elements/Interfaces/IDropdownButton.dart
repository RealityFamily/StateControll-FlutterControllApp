import 'package:flutter/material.dart';

abstract class IDropdownButton<T> extends StatelessWidget {
  final T value;
  final ValueChanged<T?> onChanged;
  final int? flexKoef;
  final List<DropdownMenuItem<T>> items;

  const IDropdownButton({
    Key? key,
    required this.value,
    required this.onChanged,
    this.flexKoef,
    required this.items,
  }) : super(key: key);
}