import 'package:faaliyet_takip_uygulamasi/ui/views/splash.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/home/home_view.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/register/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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