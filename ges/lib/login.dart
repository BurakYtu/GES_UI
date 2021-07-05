import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ges/Welcome.dart';
import 'package:ges/rounded_button.dart';
import 'package:ges/theme.dart';
import 'package:provider/provider.dart';
import 'Authentication.dart';
import 'already_have_an_account_acheck.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String loginemail = "";
  String loginpassword = "";
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
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03), SvgPicture.asset("lib/assets/login.svg", height: size.height * 0.25,),
              SizedBox(height: size.height * 0.03),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: TextFormField(
                  onChanged: (text) {
                    loginemail = text;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline, color: kPrimaryColor),
                    fillColor: kPrimaryLightColor,
                    labelText: "Enter Email",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: kPrimaryLightColor, width: 2.0),
                    ),
                  ),
                  validator: (val) {
                    if(val.length==0) {
                      return "Email cannot be empty";
                    }else{
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: TextFormField(
                  obscureText: _obscureText,
                  onChanged: (text) {
                    loginpassword = text;
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
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: kPrimaryLightColor, width: 2.0),
                    ),
                  ),
                  validator: (val) {
                    if(val.length==0) {
                      return "Password cannot be empty";
                    }else{
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
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