import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ges/theme.dart';
import 'package:provider/provider.dart';
import 'Functions/Authentication.dart';
import 'Screens/Signup.dart';
import 'Screens/Welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpScreen();
    /*
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return WelcomeScreen();
    }
    return LoginScreen();

 */
  }
}