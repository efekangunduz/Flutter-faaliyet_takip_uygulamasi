import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faaliyet_takip_uygulamasi/features/home/event_management.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/button/new_button_widget.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/formfield/dropdown_field.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/formfield/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  var _categories = <DropdownMenuItem>[];

  _loadCategories() async {
    FirebaseFirestore.instance
        .collection('Categories')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        setState(() {
          _categories.add(DropdownMenuItem(
            child: Text(doc['category']),
            value: doc['category'],
          ));
        });
      }
      ;
    });
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _loadCategories();
    });
  }

  final String _eventTitleKey = 'eventTitle';
  final String _eventTitleLabel = 'Event Title';
  final IconData _titleIcon = Icons.title;
  final String _eventDescriptionKey = 'eventDescription';
  final String _eventDescriptionLabel = 'Event Description';
  final IconData _descriptionIcon = Icons.description;
  final String _eventDateKey = 'eventDate';
  final String _eventDateLabel = 'Event Date';
  final IconData _dateIcon = Icons.date_range;
  final String _eventDetailsKey = 'eventDetails';
  final String _eventDetailsLabel = 'Event Details';
  final IconData _detailsIcon = Icons.details;
  final IconData _arrowIcon = Icons.arrow_drop_down;
  final IconData _categoryIcon = Icons.category_outlined;
  late String newValue;
  String dropdownValue = 'Meal';

  final String _saveButton = 'Save';
  String eventTitle = '';
  String eventDescription = '';
  String eventDate = '';
  String eventDetails = '';

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: ListView(
        children: [
          NewDropdownFormField(
            onChanged: (newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            rightIconData: _arrowIcon,
            valueKey: dropdownValue,
            radius: context.lowValue,
            leftIconData: _categoryIcon,
            items: _categories,
          ),
          context.emptySizedHeightBoxLow3x,
          GeneralFormField(
            valueKey: _eventTitleKey,
            obscure: false,
            labelText: _eventTitleLabel,
            formIconData: _titleIcon,
            radius: context.lowValue,
            validator: (value) {
              if (value.toString().length < 6) {
                return _eventTitleKey;
              } else {
                return null;
              }
            },
            onSaved: (value) {
              setState(() {
                eventTitle = value!;
              });
            },
          ),
          context.emptySizedHeightBoxLow3x,
          GeneralFormField(
            valueKey: _eventDescriptionKey,
            obscure: false,
            labelText: _eventDescriptionLabel,
            formIconData: _descriptionIcon,
            radius: context.lowValue,
            validator: (value) {
              if (value.toString().length < 6) {
                return _eventDescriptionKey;
              } else {
                return null;
              }
            },
            onSaved: (value) {
              setState(() {
                eventDescription = value!;
              });
            },
          ),
          context.emptySizedHeightBoxLow3x,
          GeneralFormField(
            valueKey: _eventDateKey,
            labelText: _eventDateLabel,
            obscure: false,
            formIconData: _dateIcon,
            radius: context.lowValue,
            validator: (value) {
              if (value.toString().length < 6) {
                return _eventDateKey;
              } else {
                return null;
              }
            },
            onSaved: (value) {
              setState(() {
                eventDate = value!;
              });
            },
          ),
          context.emptySizedHeightBoxLow3x,
          GeneralFormField(
            valueKey: _eventDetailsKey,
            labelText: _eventDetailsLabel,
            formIconData: _detailsIcon,
            radius: context.lowValue,
            validator: (value) {
              if (value.toString().length < 6) {
                return _eventDetailsKey;
              } else {
                return null;
              }
            },
            onSaved: (value) {
              setState(() {
                eventDetails = value!;
              });
            },
          ),
          context.emptySizedHeightBoxLow3x,
          NewButton(
              buttonText: _saveButton,
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                  addEvent(
                      category: dropdownValue,
                      newTitle: eventTitle,
                      description: eventDescription,
                      date: eventDate,
                      details: eventDetails);
                  Navigator.of(context).pushNamed("/home");
                }
              }),
        ],
      ),
    );
  }
}
