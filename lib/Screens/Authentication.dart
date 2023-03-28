import 'package:flutter/material.dart';
import '../Widgets/AuthenticationForm.dart';

enum AuthMode { Login, SignUp }

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  var authMode = AuthMode.Login;

  void changeAuthMode() {
    if (authMode == AuthMode.Login) {
      setState(() {
        authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: AuthenticationForm(authMode, changeAuthMode));
  }
}
