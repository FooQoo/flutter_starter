import 'package:flutter/material.dart';
import 'package:flutter_starter/components/uiParts/LineLogin.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
          SizedBox(
              height: 600,
              child: Center(
                  child: Text(
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      'Flutter Starter'))),
          LineLogin()
        ])));
  }
}
