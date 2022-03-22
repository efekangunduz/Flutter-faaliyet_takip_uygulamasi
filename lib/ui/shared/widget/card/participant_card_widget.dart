import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ParticipantCardWidget extends StatelessWidget {
  const ParticipantCardWidget({
    Key? key,
    required String username,
  })  : _username = username,
        super(key: key);

  final String _username;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: context.height * 0.07,
        width: context.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purpleAccent, Colors.indigoAccent]),
        ),
        child: Padding(
          padding: context.paddingLow,
          child: Column(
            children: [
              Text(
                _username,
                style: context.textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
