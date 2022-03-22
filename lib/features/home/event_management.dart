import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final CollectionReference categoryCollection =
    firestore.collection('Categories');
final CollectionReference eventCollection = firestore.collection('Events');

Future<void> addCategory({required String category}) async {
  String displayName = auth.currentUser!.displayName.toString();
  DocumentReference categoryReferencer = categoryCollection.doc(category);
  Map<String, dynamic> data = <String, dynamic>{
    "category": category,
    "addedBy": displayName,
  };
  await categoryReferencer
      .set(data)
      .whenComplete(() => print("Category added to the database"))
      .catchError((e) => print(e));
}

Future<void> addEvent({
  required String category,
  required String eventTitle,
  required String description,
  required String date,
  required String details,
}) async {
  String displayName = auth.currentUser!.displayName.toString();

  DocumentReference eventReferencer =
      categoryCollection.doc(category).collection('Events').doc(eventTitle);

  DocumentReference eventReferencer2 = eventCollection.doc(eventTitle);

  Map<String, dynamic> data = <String, dynamic>{
    "category": category,
    "eventTitle": eventTitle,
    "description": description,
    "publishedAt": date,
    "details": details,
    "addedBy": displayName,
  };

  await eventReferencer
      .set(data)
      .whenComplete(() => print("Event added to the database"))
      .catchError((e) => print(e));
  await eventReferencer2
      .set(data)
      .whenComplete(() => print("Event added to the database"))
      .catchError((e) => print(e));
}

Future<void> joinEvent(String eventTitle, String category) async {
  String? displayName = auth.currentUser!.displayName.toString();
  Map<String, dynamic> data = <String, dynamic>{
    "username": displayName,
  };
  await categoryCollection
      .doc(category)
      .collection('Events')
      .doc(eventTitle)
      .collection('Participants')
      .doc(displayName)
      .set(data);
  await eventCollection
      .doc(eventTitle)
      .collection('Participants')
      .doc(displayName)
      .set(data);
}
