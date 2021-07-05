import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ges/Welcome.dart';
import 'package:ges/rounded_button.dart';
import 'package:ges/theme.dart';
import 'package:provider/provider.dart';
import 'Authentication.dart';
import 'already_have_an_account_acheck.dart';

class LoginScreen extends StatelessWidget {
  String loginemail = "";
  String loginpassword = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03), SvgPicture.asset("lib/assets/login.svg", height: size.height * 0.25,),
              SizedBox(height: size.height * 0.03),
              TextField(
                onChanged: (text) {
                  loginemail = text;
                },
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.assignment_ind_outlined,
                    color: kPrimaryColor,
                  ),
                  hintText: "e-mail",
                  border: InputBorder.none,
                ),
              ),
              TextField(
                onChanged: (text) {
                  loginpassword = text;
                },
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: kPrimaryColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
              RoundedButton(
                text: "LOGIN",
                press: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: loginemail,
                      password: loginpassword,
                    );
                    showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                      title: const Text('Done'),
                      content: const Text('Welcome'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return WelcomeScreen();
                                },
                              ),
                            );
                          },
                          child: const Text('Take me'),
                        ),
                      ],
                    ),
                    );
                  } on FirebaseAuthException catch (e) {
                    showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text('we have a problem guys'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('try again'),
                        ),
                      ],
                    ),
                    );
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}