import 'package:flutter/material.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class Detail_6_Page extends StatelessWidget {
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
          child: Image.network('https://images.theecoexperts.co.uk/wp-content/uploads/2020/03/solar-thermal-1.jpeg'),
        ),
      )
  );
}