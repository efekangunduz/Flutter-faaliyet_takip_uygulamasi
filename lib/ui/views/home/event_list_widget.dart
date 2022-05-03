import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faaliyet_takip_uygulamasi/features/home/event_management.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/card/event_card_widget.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/home/event_details.dart';
import 'package:flutter/material.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final Query<Map<String, dynamic>> _categoryStream = FirebaseFirestore.instance
      .collection('Events')
      .where('addedBy', isEqualTo: auth.currentUser!.displayName.toString());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _categoryStream.snapshots(),
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
                      return EventDetails(
                          category: data['category'],
                          title: data['eventTitle'],
                          date: data['publishedAt'],
                          description: data['description'],
                          details: data['details'],
                          publisher: data['addedBy'],
                          photoUrl: data['photoUrl'],
                          videoUrl: data['videoUrl']);
                    },
                  ),
                );
              },
              child: EventCardWidget(
                eventTitle: data['eventTitle'],
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
