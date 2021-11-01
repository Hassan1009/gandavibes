import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ganda_vibes/authentication_services.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignIn> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                hintText: 'Enter your Email',
                labelText: 'Email',
                icon: Icon(Icons.lock),
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: passwordcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                hintText: 'Enter your Password',
                labelText: 'Password',
                icon: Icon(Icons.lock),
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text('SIGN UP'),
                onPressed: () {
                  var email = emailcontroller.text;
                  var password = passwordcontroller.text;
                  context.read<AuthenticationServices>().signIn(
                      email: emailcontroller.text,
                      password: passwordcontroller.text);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
