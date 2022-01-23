import 'dart:async';

import 'package:faaliyet_takip_uygulamasi/ui/views/base_view.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/home/home_view.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/register/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      if (FirebaseAuth.instance.currentUser == null) {
        // user not logged ==> Login Screen
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const RegisterPage()),
            (route) => false);
      } else {
        // user already logged in ==> Home Screen
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
            (route) => false);
      }
    });
  }

  final String _title = 'Faaliyet Takip APP';
  String logo = 'assets/event_management.png';
  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Padding(
        padding: context.paddingMedium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(logo),
            ),
            TweenAnimationBuilder(
              duration: context.durationLow,
              tween: Tween<double>(begin: 20, end: 70),
              builder: (_, double value, __) {
                return Wrap(
                  children: [
                    Text(_title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: value,
                            color: Theme.of(context).primaryColor)),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
