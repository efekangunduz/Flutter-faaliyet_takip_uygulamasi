import 'package:flutter/material.dart';

class RegisterFormField extends TextFormField {
  RegisterFormField({
    Key? key,
    String? valueKey,
    String? labelText,
    IconData? formIconData,
    bool obscure = false,
    double radius = 8,
    void Function(String?)? onSaved,
    String? Function(String?)? validator,
  }) : super(
          key: ValueKey(valueKey),
          obscureText: obscure,
          onSaved: onSaved,
          validator: validator,
          decoration: InputDecoration(
            labelText: labelText,
            fillColor: Colors.purple[300],
            filled: true,
            icon: Icon(formIconData),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
          ),
        );
}
