import 'package:flutter/material.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class Detail_1_Page extends StatelessWidget {
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
          child: Image.network('https://senerji.istanbul/wp-content/uploads/2021/03/roof-top-solar-1-1170x820-1.jpg'),
        ),
      )
  );
}