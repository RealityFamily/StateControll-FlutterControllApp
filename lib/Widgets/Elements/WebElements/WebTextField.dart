import 'package:flutter/material.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/ITextField.dart';

class WebTextField extends ITextField {
  WebTextField({
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
  _WebTextFieldState createState() => _WebTextFieldState(
        webTextField: this,
      );
}

class _WebTextFieldState extends State<WebTextField> {
  WebTextField _webTextField;

  bool _validate = false;

  _WebTextFieldState({
    required WebTextField webTextField,
  }) : this._webTextField = webTextField;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: _webTextField.flexKoef!,
      child: Container(
        margin: _webTextField.outMargin,
        child: TextField(
          decoration: InputDecoration(
            errorText: _validate ? "" : null,
          ),
          controller: _webTextField.controller,
          style: TextStyle(fontSize: _webTextField.textSize),
          onSubmitted: _webTextField.onSubmited,
          keyboardType: _webTextField.textInputType,
          onChanged: (value) {
            setState(() {
              if (_webTextField.textInputType == TextInputType.number) {
                _validate = (double.tryParse(value) == null || value.isEmpty);
                if (!_validate) {
                  _webTextField.onSubmited(value);
                }
              }
            });
          },
        ),
      ),
    );
  }
}
