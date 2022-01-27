import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/card/event_card_widget.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/home/event_details.dart';
import 'package:flutter/material.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final Stream<QuerySnapshot> _eventsStream =
      FirebaseFirestore.instance.collection('Events').snapshots();
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _eventsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EventDetails();
                    },
                  ),
                );
              },
              child: EventCardWidget(
                eventTitle: data['newTitle'],
                eventDate: data['publishedAt'],
                eventDescription: data['description'],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
