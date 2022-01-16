import 'package:flutter/material.dart';

class NewTextButton extends StatefulWidget {
  const NewTextButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String buttonText;

  @override
  State<NewTextButton> createState() => _NewTextButtonState();
}

class _NewTextButtonState extends State<NewTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Text(widget.buttonText),
    );
  }
}
