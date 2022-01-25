import 'package:flutter/material.dart';

class NewDropdownFormField extends DropdownButtonFormField {
  NewDropdownFormField({
    Key? key,
    String? valueKey,
    required List<DropdownMenuItem<dynamic>>? items,
    IconData? formIconData,
    void Function(dynamic)? onChanged,
    void Function(dynamic)? onSaved,
    double radius = 8,
  }) : super(
          key: key,
          value: valueKey,
          items: items,
          icon: Icon(formIconData),
          onChanged: onChanged,
          onSaved: onSaved,
        );
}
