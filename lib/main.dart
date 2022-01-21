import 'package:faaliyet_takip_uygulamasi/ui/views/splash.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/home/home_view.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      home: const RegisterPage(),
      routes: {
        // "/": (context) => SplashView(),
        "/splash": (context) => const SplashScreen(),
        "/register": (context) => const RegisterPage(),
        "/home": (context) => const HomePage(),
      },
    );
  }
}
