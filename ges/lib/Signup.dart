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
              SvgPicture.asset("lib/assets/signup.svg", height: size.height * 0.2,),
              SizedBox(height: size.height * 0.04),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: TextFormField(
                  onChanged: (text) {
                    email = text;
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                height: size.width * 0.15,
                child: OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                  ),
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
                                    return LogInScreen();
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
                  child: Text("Sing Up"),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
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