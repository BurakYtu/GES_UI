import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:ges/Welcome.dart';
import 'package:ges/homepage.dart';

class DecisionsTree extends StatefulWidget {
  @override
  _DecisionsTreeState createState() => _DecisionsTreeState();
}

class _DecisionsTreeState extends State<DecisionsTree> {

  User user;
  @override
  void initState(){
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  onRefresh(userCred){
    setState(() {
      user = userCred;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(user == null){
      return WelcomeScreen();
    }
    return HomePage();
  }
}
