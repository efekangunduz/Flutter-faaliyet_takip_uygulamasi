import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({
    Key? key,
    required String eventTitle,
    required String eventDate,
    required String eventDescription,
  })  : _eventTitle = eventTitle,
        _eventDate = eventDate,
        _eventDescription = eventDescription,
        super(key: key);

  final String _eventTitle;
  final String _eventDate;
  final String _eventDescription;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: context.height * 0.2,
        width: context.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purpleAccent, Colors.indigoAccent]),
        ),
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              Text(
                _eventTitle,
                style: context.textTheme.headline6,
              ),
              Text(
                _eventDescription,
                style: context.textTheme.bodyText1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _eventDate,
                    style: context.textTheme.caption,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: const ButtonStyle(alignment: Alignment.centerRight),
                    child: Text(
                      'Detaylar Icin tiklayiniz',
                      style: context.textTheme.button,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
