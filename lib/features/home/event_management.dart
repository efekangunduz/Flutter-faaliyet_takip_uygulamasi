import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final CollectionReference mainCollection = firestore.collection('Events');

Future<void> addEvent({
  required String category,
  required String newTitle,
  required String description,
  required String date,
  required String details,
}) async {
  String displayName = auth.currentUser!.displayName.toString();
  DocumentReference documentReferencer = mainCollection.doc(newTitle);

  Map<String, dynamic> data = <String, dynamic>{
    "category": category,
    "newTitle": newTitle,
    "description": description,
    "publishedAt": date,
    "details": details,
    "displayName": displayName,
  };

  await documentReferencer
      .set(data)
      .whenComplete(() => print("Event item added to the database"))
      .catchError((e) => print(e));
}
