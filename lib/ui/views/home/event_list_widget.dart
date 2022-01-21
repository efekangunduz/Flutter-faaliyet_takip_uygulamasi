import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/card/event_card_widget.dart';
import 'package:flutter/material.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final String _eventTitle = 'Cuma günü saat 2.00\'da eğitim var.';
  final String _eventDescription = 'Eğitimi kaçırmayınız.';
  final String _eventDate = '11.05.2021';
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        EventCardWidget(
          eventTitle: _eventTitle,
          eventDate: _eventDate,
          eventDescription: _eventDescription,
        ),
      ],
    );
  }
}
