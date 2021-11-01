import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ganda_vibes/authentication_services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        home: Center(
          child: ElevatedButton(
            child: Text('LOG OUT'),
            onPressed: () {
              context.read<AuthenticationServices>().signOut();
            },
          ),
        ),
      ),
    );
  }
}
