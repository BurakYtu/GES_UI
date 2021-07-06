import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ges/theme.dart';
import 'already_have_an_account_acheck.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = "";
  String password = "";
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset("lib/assets/signup.svg", height: size.height * 0.18,),
              SizedBox(height: size.height * 0.04),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: TextFormField(
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                  onChanged: (text) {
                    email = text;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline, color: kPrimaryColor),
                    fillColor: kPrimaryLightColor,
                    labelText: "Enter Email",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.blue.withOpacity(0.3), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: kPrimaryLightColor, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: TextFormField(
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                  obscureText: _obscureText,
                  onChanged: (text) {
                    password = text;
                  },
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      color: kPrimaryColor,
                      icon: Icon(Icons.vpn_key_outlined),
                      onPressed: (){
                        _toggle();
                      },
                    ),
                    labelText: "Enter Password",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.blue.withOpacity(0.3), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: kPrimaryLightColor, width: 2.0),
                    ),
                  ),
                  //keyboardType: TextInputType.visiblePassword,
                ),
              ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: kPrimaryLightColor,
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                        title: const Text('Done'),
                        content: const Text('Registration successful, please login.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LogInScreen();
                                  },
                                ),
                              );
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password' || password.length < 6) {
                        showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Please make sure your password longer than 6 character.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('try again'),
                            ),
                          ],
                        ),
                        );
                      } else if (e.code == 'email-already-in-use') {
                        showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Email already in use.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('try again'),
                            ),
                          ],
                        ),
                        );
                      }
                    } catch (e) {
                      showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                        title: const Text('Error'),
                        content: e,
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('try again'),
                          ),
                        ],
                      ),
                      );
                    }
                  },
                  child: Text(
                    "Sing Up",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return LogInScreen();
                    },
                  ), (Route<dynamic> route) => false,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}