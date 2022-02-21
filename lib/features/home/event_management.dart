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
  List<String> participants = const [],
}) async {
  String displayName = auth.currentUser!.displayName.toString();

  DocumentReference eventReferencer =
      categoryCollection.doc(category).collection('Events').doc(eventTitle);

  Map<String, dynamic> data = <String, dynamic>{
    "category": category,
    "eventTitle": eventTitle,
    "description": description,
    "publishedAt": date,
    "details": details,
    "addedBy": displayName,
    "participants": participants,
  };

  await eventReferencer
      .set(data)
      .whenComplete(() => print("Event added to the database"))
      .catchError((e) => print(e));
}

Future<void> addEvent2({
  required String category,
  required String eventTitle,
  required String description,
  required String date,
  required String details,
  List<String> participants = const [],
}) async {
  String displayName = auth.currentUser!.displayName.toString();

  DocumentReference eventReferencer = eventCollection.doc(eventTitle);

  Map<String, dynamic> data = <String, dynamic>{
    "category": category,
    "eventTitle": eventTitle,
    "description": description,
    "publishedAt": date,
    "details": details,
    "addedBy": displayName,
    "participants": participants
  };

  await eventReferencer
      .set(data)
      .whenComplete(() => print("Event added to the database"))
      .catchError((e) => print(e));
}

Future<void> joinEvent(String eventTitle, String category) async {
  String displayName = auth.currentUser!.displayName.toString();
  await categoryCollection
      .doc(category)
      .collection('Events')
      .doc(eventTitle)
      .update({'participants': displayName});
  await eventCollection.doc(eventTitle).update({'participants': displayName});
}
