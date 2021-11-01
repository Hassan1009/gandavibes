import 'package:flutter/material.dart';
import 'package:ganda_vibes/authentication_services.dart';
import 'package:ganda_vibes/home_page.dart';
import 'package:ganda_vibes/sign_up.dart';
import 'sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationServices>(
          create: (_) => AuthenticationServices(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationServices>().authStateChanges,
          initialData: null,
        )
      ],
      child: const MaterialApp(
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User>();

    if (firebaseuser != null) {
      return const HomePage();
    }
    return const SignUp();
  }
}
