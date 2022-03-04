import 'package:faaliyet_takip_uygulamasi/features/home/notifications.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/splash.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/home/home_view.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/register/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  requestPermission();
  loadFCM();
  listenFCM();
  runApp(const MyApp());
}

@override
void initState() {
  requestPermission();
  loadFCM();
  listenFCM();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: const SplashScreen(),
      routes: {
        // "/": (context) => SplashView(),
        "/splash": (context) => const SplashScreen(),
        "/register": (context) => const RegisterPage(),
        "/home": (context) => const HomePage(),
      },
    );
  }
}
