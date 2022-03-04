import 'package:faaliyet_takip_uygulamasi/features/home/notifications.dart';
import 'package:faaliyet_takip_uygulamasi/features/register/auth/auth.dart';
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
  String registerButton = 'Register';
  String loginButton = 'Login';
  String logo = 'assets/event_management.png';
  String name = 'name';
  String surname = 'surname';
  String username = 'username';
  String password = 'password';
  String email = 'email';
  String nameErrorText = 'Name is too short';
  String surnameErrorText = 'Surame is too short';
  String usernameErrorText = 'Username is too short';
  String passwordErrorText = 'Password is too short';
  String emailErrorText = 'Email is not valid';
  String buttonText = 'I have already an account';
  IconData nameFormIcon = Icons.account_box;
  IconData usernameFormIcon = Icons.account_circle;
  IconData emailFormIcon = Icons.email;
  IconData passwordFormIcon = Icons.lock;
  bool _haveAnAccount = false;
  final _formkey = GlobalKey<FormState>();
  String name1 = '';
  String surname1 = '';
  String username1 = '';
  String password1 = '';
  String email1 = '';
  void changeState() {
    _haveAnAccount = !_haveAnAccount;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            SizedBox(
                height: context.mediaQuery.viewInsets.bottom > 0
                    ? 0
                    : context.height * 0.3,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: context.lowBorderRadius),
                  child: Image.asset(logo),
                )),
            const Spacer(flex: 2),
            !_haveAnAccount
                ? Expanded(
                    child: GeneralFormField(
                      valueKey: name,
                      formIconData: nameFormIcon,
                      labelText: name,
                      obscure: false,
                      radius: context.lowValue,
                      validator: (value) {
                        if (value.toString().length < 6) {
                          return nameErrorText;
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          name1 = value!;
                        });
                      },
                    ),
                  )
                : Container(),
            const Spacer(),
            !_haveAnAccount
                ? Expanded(
                    child: GeneralFormField(
                      valueKey: surname,
                      formIconData: nameFormIcon,
                      labelText: surname,
                      obscure: false,
                      radius: context.lowValue,
                      validator: (value) {
                        if (value.toString().length < 6) {
                          return surnameErrorText;
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          surname1 = value!;
                        });
                      },
                    ),
                  )
                : Container(),
            const Spacer(),
            !_haveAnAccount
                ? Expanded(
                    child: GeneralFormField(
                      valueKey: username,
                      formIconData: usernameFormIcon,
                      labelText: username,
                      obscure: false,
                      radius: context.lowValue,
                      validator: (value) {
                        if (value.toString().length < 6) {
                          return usernameErrorText;
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          username1 = value!;
                        });
                      },
                    ),
                  )
                : Container(),
            const Spacer(),
            Expanded(
              child: GeneralFormField(
                valueKey: email,
                formIconData: emailFormIcon,
                labelText: email,
                obscure: false,
                radius: context.lowValue,
                validator: (value) {
                  if (value.toString().length < 6) {
                    return emailErrorText;
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    email1 = value!;
                  });
                },
              ),
            ),
            const Spacer(),
            Expanded(
              child: GeneralFormField(
                valueKey: password,
                formIconData: passwordFormIcon,
                labelText: password,
                obscure: true,
                radius: context.lowValue,
                validator: (value) {
                  if (value.toString().length < 6) {
                    return passwordErrorText;
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    password1 = value!;
                  });
                },
              ),
            ),
            const Spacer(),
            Expanded(
                child: NewButton(
                    buttonText: !_haveAnAccount ? registerButton : loginButton,
                    onPressed: () {
                      !_haveAnAccount
                          ? {
                              if (_formkey.currentState!.validate())
                                {
                                  _formkey.currentState!.save(),
                                  register(email1, password1, username1, name1,
                                      surname1),
                                  subscribeTopic(),
                                  Navigator.of(context).pushNamed("/home"),
                                }
                              else
                                {
                                  print('Wrong formkey'),
                                }
                            }
                          : {
                              if (_formkey.currentState!.validate())
                                {
                                  _formkey.currentState!.save(),
                                  login(email1, password1),
                                  subscribeTopic(),
                                  Navigator.of(context).pushNamed("/home"),
                                }
                              else
                                {
                                  print('Wrong formkey'),
                                }
                            };
                    })),
            NewTextButton(
              buttonText: buttonText,
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
