import 'package:flutter/material.dart';

class NewDropdownFormField extends DropdownButtonFormField {
  NewDropdownFormField({
    Key? key,
    String? valueKey,
    required List<DropdownMenuItem<dynamic>>? items,
    IconData? rightIconData,
    IconData? leftIconData,
    void Function(dynamic)? onChanged,
    void Function(dynamic)? onSaved,
    double radius = 8,
  }) : super(
            key: key,
            value: valueKey,
            items: items,
            icon: Icon(rightIconData),
            onChanged: onChanged,
            onSaved: onSaved,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
              ),
              labelText: 'Categories',
              filled: true,
              fillColor: Colors.purple[300],
              icon: Icon(leftIconData),
            ));
}
