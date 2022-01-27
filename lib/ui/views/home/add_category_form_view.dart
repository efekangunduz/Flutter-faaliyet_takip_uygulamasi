import 'package:faaliyet_takip_uygulamasi/features/home/event_management.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/button/new_button_widget.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/formfield/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  IconData denemeIcon = Icons.train;
  final String _saveButton = 'Save';
  final String _categoryKey = 'category';
  final String _categoryLabel = 'Category';
  final IconData _categoryIcon = Icons.category;
  String category = '';

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: ListView(
        children: [
          GeneralFormField(
            valueKey: _categoryKey,
            labelText: _categoryLabel,
            formIconData: _categoryIcon,
            radius: context.lowValue,
            validator: (value) {
              if (value.toString().length < 1) {
                return _categoryKey;
              } else {
                return null;
              }
            },
            onSaved: (value) {
              setState(() {
                category = value!;
              });
            },
          ),
          NewButton(
              buttonText: _saveButton,
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                  addCategory(category: category);
                  Navigator.of(context).pushNamed("/home");
                }
              }),
        ],
      ),
    );
  }
}
