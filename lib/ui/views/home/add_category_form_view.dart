import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/button/new_button_widget.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/formfield/text_field_widget.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: [
          RegisterTextField(
            textFormKey: 'categoryTitle',
            labelText: 'Category Title',
            obscure: true,
            formIcon: Icon(Icons.title),
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
