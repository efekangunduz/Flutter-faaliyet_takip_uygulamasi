import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/card/participant_card_widget.dart';
import 'package:flutter/material.dart';

class ParticipantsList extends StatefulWidget {
  const ParticipantsList({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  _ParticipantsListState createState() => _ParticipantsListState();
}

class _ParticipantsListState extends State<ParticipantsList> {
  late final Stream<QuerySnapshot> _categoryStream = FirebaseFirestore.instance
      .collection('Events')
      .doc(widget.title)
      .collection('Participants')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _categoryStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return GestureDetector(
                child: ParticipantCardWidget(
              username: data['username'],
            ));
          }).toList(),
        );
      },
    );
  }
}
