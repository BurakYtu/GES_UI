import 'package:flutter/material.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class Detail_4_Page extends StatelessWidget {
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
          child: Image.network('http://www.bdg-usa.com/wp-content/uploads/2017/06/drone-thermal-imaging-solar-panel-inspection-2-300x240.jpg'),
        ),
      )
  );
}