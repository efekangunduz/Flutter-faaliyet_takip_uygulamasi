import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    Key? key,
    required String textFormKey,
    required String labelText,
    required bool obscure,
    String? errorText,
    required Icon formIcon,
  })  : _textFormKey = textFormKey,
        _labelText = labelText,
        _obscure = obscure,
        _errorText = errorText,
        _formIcon = formIcon,
        super(key: key);

  final String _textFormKey;
  final String _labelText;
  final bool _obscure;
  final String? _errorText;
  final Widget _formIcon;
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
        icon: _formIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(context.lowRadius),
        ),
      ),
    );
  }
}
