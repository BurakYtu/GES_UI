import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ges/rounded_button.dart';
import 'package:ges/rounded_input_field.dart';
import 'package:ges/rounded_password_field.dart';
import 'package:ges/social_icon.dart';
import 'package:ges/theme.dart';
import 'Authentication.dart';
import 'already_have_an_account_acheck.dart';
import 'login.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  String email = "";
  String password = "";

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
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset("lib/assets/signup.svg", height: size.height * 0.2,),
              SizedBox(height: size.height * 0.03),
              TextField(
                onChanged: (text) {
                  email = text;
                },
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "e-mail",
                  border: InputBorder.none,
                ),
              ),
              TextField(
                onChanged: (text) {
                  password = text;
                },
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "password",
                  border: InputBorder.none,
                ),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                      title: const Text('Done'),
                      content: const Text('Welcome to our world!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginScreen();
                                },
                              ),
                            );
                          },
                          child: const Text('Thanks :)'),
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
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text("SingUp"),
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.02), width: size.width * 0.8,
                child: Row(
                  children: <Widget>[
                    buildDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("OR",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    buildDivider(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "lib/assets/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "lib/assets/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "lib/assets/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Expanded buildDivider() {
  return Expanded(
    child: Divider(
      color: Color(0xFFD9D9D9),
      height: 1.5,
    ),
  );
}