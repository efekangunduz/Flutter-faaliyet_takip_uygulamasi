import 'package:faaliyet_takip_uygulamasi/base_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String _button = "Save";
  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: AppBar(),
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                TextField(),
                TextField(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(_button),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
