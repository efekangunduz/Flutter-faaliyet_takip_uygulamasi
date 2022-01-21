import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BaseView extends StatelessWidget {
  final AppBar? appBar;
  final Widget child;
  const BaseView({Key? key, required this.child, this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: appBar,
          body: Padding(
            padding: context.paddingLow,
            child: child,
          )),
    );
  }
}
