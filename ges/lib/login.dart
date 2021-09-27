import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ges/theme.dart';
import 'Signup.dart';
import 'already_have_an_account_acheck.dart';
import 'homepage.dart';

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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset("lib/assets/login.svg", height: size.height * 0.2),
              SizedBox(height: size.height * 0.04),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: TextFormField(
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                  onChanged: (text) {
                    loginemail = text;
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
                    color: kPrimaryColor,
                    onPressed: () async {
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
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                  builder: (context) {
                                    return HomePage();
                                  },
                                ), (Route<dynamic> route) => false,);
                              },
                              child: const Text('Take me'),
                            ),
                          ],
                        ),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                            title: const Text('Error'),
                            content: const Text('User not found'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('try again'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SignUpScreen();
                                    },
                                  ),
                                ),
                                child: const Text('sing up'),
                              ),
                            ],
                          ),
                          );
                        } else if (e.code == 'wrong-password') {
                          showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Wrong password'),
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
                      "Sing In",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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