import 'package:flutter/material.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/ITextField.dart';

class AndroidTextField extends ITextField {
  AndroidTextField({
    Key? key,
    required ValueChanged<String> onSubmited,
    double? textSize,
    TextEditingController? controller,
    TextInputType? textInputType,
    int? flexKoef,
    EdgeInsets? outMargin,
  }) : super(
          key: key,
          onSubmited: onSubmited,
          textSize: textSize,
          controller: controller,
          textInputType: textInputType,
          flexKoef: flexKoef,
          outMargin: outMargin,
        );

  @override
  _AndroidTextFieldState createState() =>
      _AndroidTextFieldState(androidTextField: this);
}

class _AndroidTextFieldState extends State<AndroidTextField> {
  AndroidTextField _androidTextField;

  bool _validate = false;

  _AndroidTextFieldState({required AndroidTextField androidTextField})
      : this._androidTextField = androidTextField;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: _androidTextField.flexKoef!,
      child: Container(
        margin: _androidTextField.outMargin,
        child: TextField(
          decoration: InputDecoration(
            errorText: _validate ? "" : null,
          ),
          controller: _androidTextField.controller,
          style: TextStyle(
            fontSize: _androidTextField.textSize,
          ),
          onSubmitted: _androidTextField.onSubmited,
          keyboardType: _androidTextField.textInputType,
          onChanged: (value) {
            setState(() {
              if (_androidTextField.textInputType == TextInputType.number) {
                _validate = (double.tryParse(value) == null || value.isEmpty);
                if (!_validate) {
                  _androidTextField.onSubmited(value);
                }
              }
            });
          },
        ),
      ),
    );
  }
}
