import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/button/new_button_widget.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/button/new_dropdown_widget.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/formfield/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final String _eventTitleKey = 'eventTitle';
  String _eventTitleLabel = 'Event Title';
  final IconData _titleIcon = Icons.title;
  final String _eventDescriptionKey = 'eventDescription';
  String _eventDescriptionLabel = 'Event Description';
  final IconData _descriptionIcon = Icons.description;
  final String _eventDateKey = 'eventDateKey';
  String _eventDateLabel = 'Event Date';
  final IconData _dateIcon = Icons.date_range;
  final String _saveButton = 'Save';
  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: [
          const NewDropdownWidget(),
          TextFormField(
            key: ValueKey(_eventTitleKey),
            obscureText: false,
            validator: (value) {
              if (value.toString().length < 6) {
                return _eventTitleKey;
              } else {
                return null;
              }
            },
            onSaved: (value) {
              setState(() {
                _eventTitleLabel = value!;
              });
            },
            decoration: InputDecoration(
              labelText: _eventTitleLabel,
              fillColor: Colors.purple[50],
              filled: true,
              icon: Icon(_titleIcon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(context.lowRadius),
              ),
            ),
          ),
          TextFormField(
            key: ValueKey(_eventDescriptionKey),
            obscureText: false,
            validator: (value) {
              if (value.toString().length < 6) {
                return _eventDescriptionLabel;
              } else {
                return null;
              }
            },
            onSaved: (value) {
              setState(() {
                _eventDescriptionLabel = value!;
              });
            },
            decoration: InputDecoration(
              labelText: _eventDescriptionLabel,
              fillColor: Colors.purple[50],
              filled: true,
              icon: Icon(_descriptionIcon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(context.lowRadius),
              ),
            ),
          ),
          TextFormField(
            key: ValueKey(_eventDateKey),
            obscureText: false,
            validator: (value) {
              if (value.toString().length < 6) {
                return _eventDateLabel;
              } else {
                return null;
              }
            },
            onSaved: (value) {
              setState(() {
                _eventDateLabel = value!;
              });
            },
            decoration: InputDecoration(
              labelText: _eventDateLabel,
              fillColor: Colors.purple[50],
              filled: true,
              icon: Icon(_dateIcon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(context.lowRadius),
              ),
            ),
          ),
          NewButton(
            buttonText: _saveButton,
            onPressed: () => Navigator.of(context).pushNamed("/home"),
          ),
        ],
      ),
    );
  }
}
