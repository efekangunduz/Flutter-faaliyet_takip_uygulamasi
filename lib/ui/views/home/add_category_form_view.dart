import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/button/new_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  String? deneme;
  IconData denemeIcon = Icons.train;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: [
          TextFormField(
            key: ValueKey('deneme'),
            obscureText: false,
            validator: (value) {
              if (value.toString().length < 6) {
                return 'deneme';
              } else {
                return null;
              }
            },
            onSaved: (value) {
              setState(() {
                deneme = value!;
              });
            },
            decoration: InputDecoration(
              labelText: deneme,
              fillColor: Colors.purple[50],
              filled: true,
              icon: Icon(denemeIcon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(context.lowRadius),
              ),
            ),
          ),
          NewButton(
            buttonText: 'Save',
            onPressed: () => Navigator.of(context).pushNamed("/home"),
          ),
        ],
      ),
    );
  }
}
