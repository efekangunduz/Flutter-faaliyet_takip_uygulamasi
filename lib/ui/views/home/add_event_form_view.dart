import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/button/new_button_widget.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/button/new_dropdown_widget.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/formfield/text_field_widget.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final String _eventTitleKey = 'eventTitle';
  final String _eventTitleLabel = 'Event Title';
  final IconData _titleIcon = Icons.title;
  final String _eventDescriptionKey = 'eventDescription';
  final String _eventDescriptionLabel = 'Event Description';
  final IconData _descriptionIcon = Icons.description;
  final String _eventDateKey = 'eventDateKey';
  final String _eventDateLabel = 'Event Date';
  final IconData _dateIcon = Icons.date_range;
  final String _saveButton = 'Save';
  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: [
          NewDropdownWidget(),
          RegisterTextField(
            textFormKey: _eventTitleKey,
            labelText: _eventTitleLabel,
            obscure: true,
            formIcon: Icon(_titleIcon),
          ),
          RegisterTextField(
              textFormKey: _eventDescriptionKey,
              labelText: _eventDescriptionLabel,
              obscure: true,
              formIcon: Icon(_descriptionIcon)),
          RegisterTextField(
              textFormKey: _eventDateKey,
              labelText: _eventDateLabel,
              obscure: true,
              formIcon: Icon(_dateIcon)),
          NewButton(
            buttonText: _saveButton,
            onPressed: () => Navigator.of(context).pushNamed("/home"),
          ),
        ],
      ),
    );
  }
}
