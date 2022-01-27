import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final CollectionReference mainCollection = firestore.collection('Events');
final CollectionReference categoryCollection =
    firestore.collection('Categories');

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

Future<void> addCategory({required String category}) async {
  String displayName = auth.currentUser!.displayName.toString();
  DocumentReference documentReferencer = categoryCollection.doc(category);
  Map<String, dynamic> data = <String, dynamic>{
    "category": category,
    "displayName": displayName,
  };
  await documentReferencer
      .set(data)
      .whenComplete(() => print("Category item added to the database"))
      .catchError((e) => print(e));
}
