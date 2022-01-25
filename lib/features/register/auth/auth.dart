import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseAuth auth = FirebaseAuth.instance;
Future register(String email, String password, String username, String name,
    String surname) async {
  try {
    await Firebase.initializeApp();
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User? updateUser = FirebaseAuth.instance.currentUser;
    updateUser!.updateDisplayName(username);
    userSetup(username, name, surname);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

Future login(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    print('///////// Success Login ////////////');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

Future logout() async {
  await FirebaseAuth.instance.signOut();
  print('///// Success Logout //////.');
}

Future<void> userSetup(displayName, name, surname) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  String uid = auth.currentUser!.uid.toString();
  bool admin = false;
  String phone = '';
  DocumentReference documentReferencer = users.doc(displayName);

  Map<String, dynamic> data = <String, dynamic>{
    'displayName': displayName,
    'uid': uid,
    'admin': admin,
    'name': name,
    'surname': surname,
    'phone': phone,
  };

  await documentReferencer
      .set(data)
      .whenComplete(() => print("User created"))
      .catchError((e) => print(e));
}
