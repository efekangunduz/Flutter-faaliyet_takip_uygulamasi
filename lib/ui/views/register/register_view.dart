import 'package:faaliyet_takip_uygulamasi/ui/views/base_view.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/button/new_button_widget.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/button/new_textbutton.dart';
import 'package:faaliyet_takip_uygulamasi/ui/shared/widget/formfield/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final String _registerButton = 'Register';
  final String _loginButton = 'Login';
  final String _logo = 'assets/event_management.png';
  final String _name = 'name';
  final String _username = 'username';
  final String _password = 'password';
  final String _email = 'email';
  final String _nameErrorText = 'Name is too short';
  final String _usernameErrorText = 'Username is too short';
  final String _passwordErrorText = 'Password is too short';
  final String _emailErrorText = 'Email is not valid';
  final String _buttonText = 'I have already an account';
  final Icon _nameFormIcon = const Icon(Icons.account_box);
  final Icon _usernameFormIcon = const Icon(Icons.account_circle);
  final Icon _emailFormIcon = const Icon(Icons.email);
  final Icon _passwordFormIcon = const Icon(Icons.lock);
  bool _haveAnAccount = false;

  void changeState() {
    _haveAnAccount = !_haveAnAccount;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Form(
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: context.lowBorderRadius),
                  child: Image.asset(_logo),
                )),
            context.emptySizedHeightBoxNormal,
            !_haveAnAccount
                ? Expanded(
                    child: RegisterTextField(
                    textFormKey: _name,
                    labelText: _name,
                    errorText: _nameErrorText,
                    obscure: false,
                    formIcon: _nameFormIcon,
                  ))
                : Container(),
            context.emptySizedHeightBoxLow,
            !_haveAnAccount
                ? Expanded(
                    child: RegisterTextField(
                    textFormKey: _username,
                    labelText: _username,
                    errorText: _usernameErrorText,
                    obscure: false,
                    formIcon: _usernameFormIcon,
                  ))
                : Container(),
            context.emptySizedHeightBoxLow,
            Expanded(
                child: RegisterTextField(
              textFormKey: _email,
              labelText: _email,
              errorText: _emailErrorText,
              obscure: false,
              formIcon: _emailFormIcon,
            )),
            context.emptySizedHeightBoxLow,
            Expanded(
                child: RegisterTextField(
              textFormKey: _password,
              labelText: _password,
              errorText: _passwordErrorText,
              obscure: true,
              formIcon: _passwordFormIcon,
            )),
            context.emptySizedHeightBoxLow,
            !_haveAnAccount
                ? Expanded(
                    child: NewButton(
                      buttonText: _registerButton,
                      onPressed: () => Navigator.of(context).pushNamed("/home"),
                    ),
                  )
                : Expanded(
                    child: NewButton(
                      buttonText: _loginButton,
                      onPressed: () => Navigator.of(context).pushNamed("/home"),
                    ),
                  ),
            NewTextButton(
              buttonText: _buttonText,
              onPressed: () {
                setState(() {
                  changeState();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
