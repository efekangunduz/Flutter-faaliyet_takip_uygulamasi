import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class NewDropdownWidget extends StatefulWidget {
  const NewDropdownWidget({Key? key}) : super(key: key);

  @override
  _NewDropdownWidgetState createState() => _NewDropdownWidgetState();
}

class _NewDropdownWidgetState extends State<NewDropdownWidget> {
  String dropdownValue = 'Entertainment';
  final IconData _arrowIcon = Icons.arrow_drop_down;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      decoration: BoxDecoration(
        color: Colors.purple[50],
        border: Border.all(
          color: Colors.black87,
        ),
        borderRadius: BorderRadius.all(Radius.circular(context.lowValue)),
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(_arrowIcon),
        style: const TextStyle(color: Colors.deepPurple),
        borderRadius: BorderRadius.all(Radius.circular(context.lowValue)),
        dropdownColor: Colors.purple[50],
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Entertainment', 'Meal', 'Education']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
