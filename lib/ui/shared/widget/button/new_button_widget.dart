import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class NewButton extends StatelessWidget {
  const NewButton({
    Key? key,
    required String buttonText,
    required this.onPressed,
  })  : _buttonText = buttonText,
        super(key: key);

  final String _buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(style: BorderStyle.solid),
        backgroundColor: Colors.purple[100],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.lowValue)),
      ),
      child: Container(
          padding: context.paddingLow,
          child: Text(
            _buttonText,
          )),
    );
  }
}
