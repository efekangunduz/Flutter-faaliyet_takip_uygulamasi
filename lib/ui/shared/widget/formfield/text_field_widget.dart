import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    Key? key,
    required String textFormKey,
    required String labelText,
    required bool obscure,
    String? errorText,
  })  : _textFormKey = textFormKey,
        _labelText = labelText,
        _obscure = obscure,
        _errorText = errorText,
        super(key: key);

  final String _textFormKey;
  final String _labelText;
  final bool _obscure;
  final String? _errorText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey(_textFormKey),
      validator: (value) {
        if (value.toString().length < 6) {
          return _errorText;
        } else {
          return null;
        }
      },
      obscureText: _obscure,
      decoration: InputDecoration(
        labelText: _labelText,
        fillColor: Colors.purple[50],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(context.normalValue),
            topRight: Radius.circular(context.normalValue),
            bottomLeft: Radius.circular(context.normalValue),
            bottomRight: Radius.circular(context.normalValue),
          ),
        ),
      ),
    );
  }
}
