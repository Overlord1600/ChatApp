import 'package:chat_app/Screens/Authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/AuthenticationData.dart';

class AuthenticationForm extends StatelessWidget {
  Enum authMode;
  Function changeFn;

  AuthenticationForm(this.authMode, this.changeFn);
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Map data = {'Email': '', 'Username': '', 'Password': ''};
    void submitData(data) {
      FocusScope.of(context).unfocus();
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        Provider.of<AuthenticationData>(context, listen: false)
            .userAuthentication(data, context, authMode);
      }
    }

    return Container(
      height: MediaQuery.of(context).size.height / 2,
      margin: EdgeInsets.only(
          left: 25, right: 25, top: MediaQuery.of(context).size.height / 4),
      child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: authMode == AuthMode.Login
                    ? const Text(
                        'Welcome, Please Login',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      )
                    : const Text('Welcome, Please SignUp',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
              ),
              TextFormField(
                key: const ValueKey('Email'),
                validator: (value) {
                  if (!value!.contains('.com') || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onSaved: (newValue) {
                  data['Email'] = newValue!.trim();
                },
                decoration:
                    const InputDecoration(hintText: 'Enter your email address'),
              ),
              if (authMode == AuthMode.SignUp)
                TextFormField(
                  key: const ValueKey('Username'),
                  validator: (value) {
                    if (value!.length < 4) {
                      return 'Username shall contain more than four charcters';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onSaved: (newValue) {
                    data['Username'] = newValue!.trim();
                  },
                  decoration: const InputDecoration(hintText: 'Enter Username'),
                ),
              TextFormField(
                key: const ValueKey('Password'),
                validator: (value) {
                  if (value!.length < 8) {
                    return 'Password should contain eight or more characters';
                  }
                  return null;
                },
                obscureText: true,
                autocorrect: false,
                onSaved: (newValue) {
                  data['Password'] = newValue!.trim();
                },
                decoration:
                    const InputDecoration(hintText: 'Enter your password'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      submitData(data);
                    },
                    child: authMode == AuthMode.Login
                        ? const Text('Login')
                        : const Text('Sign Up')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('or'),
                ],
              ),
              TextButton(
                  onPressed: () {
                    changeFn();
                  },
                  child: authMode == AuthMode.Login
                      ? const Text('Create a new account')
                      : const Text('Login to your account'))
            ],
          )),
    );
  }
}
