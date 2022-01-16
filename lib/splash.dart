import 'dart:async';

import 'package:faaliyet_takip_uygulamasi/base_view.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/logiin/register_view.dart';
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
    Timer(context.durationSlow, () {
      // user not logged ==> Login Screen
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const RegisterPage()),
          (route) => false);
    });
  }

  final String _title = 'Faaliyet Takip APP';
  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Padding(
        padding: context.paddingMedium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network('https://picsum.photos/200'),
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
