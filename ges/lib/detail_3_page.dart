import 'package:flutter/material.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class Detail_3_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    //drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Analytics'),
        centerTitle: true,
        backgroundColor: Color(0XFF34495E),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 600,
          child: Image.network('https://4.imimg.com/data4/KE/MP/MY-16227556/thermalimage1_solarpanel1_iz-500x500.jpg'),
        ),
      )
  );
}