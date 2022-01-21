import 'package:flutter/material.dart';

class NewTab extends StatelessWidget {
  const NewTab({
    Key? key,
    required String iconTitle,
    required Icon icon,
  })  : _iconTitle = iconTitle,
        _icon = icon,
        super(key: key);

  final String _iconTitle;
  final Icon _icon;

  @override
  Widget build(BuildContext context) {
    return Tab(icon: _icon, text: _iconTitle);
  }
}
