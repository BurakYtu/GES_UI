import 'package:flutter/material.dart';
import 'package:ges/main.dart';
import 'myflexiableappbar.dart';
import 'myappbar.dart';
import 'package:ges/sidebar.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF34495E),
      drawer: SideBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0XFF34495E),
            title: MyAppBar(),
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: MyFlexiableAppBar(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return Container(
              color: index.isOdd ? Colors.white70 : Colors.blueGrey,
              height: 100.0,
              child: Center(
                child: Text(
                    '$index',
                    textScaleFactor: 5,
                  style: TextStyle(
                    color: Colors.white70
                  ),
                ),
              ),
            );
          },
          childCount: 20,),
          ),
        ],
      ),
    );
  }
}
/*

Widget myCardDetails(String imageVal, String currencyName, List<double> data,
    String currencyVal, String currencyPercentage, String currencyStatus,
    int colorVal) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: myCurrencies(
            imageVal,
            currencyName,
            data,
            currencyVal,
            currencyPercentage,
            currencyStatus,
            colorVal),
      ),
    ),
  );
}

Center myCurrencies(String imageVal, String currencyName, List<double> data,
    String currencyVal, String currencyPercentage, String currencyStatus,
    int colorVal) {
  return Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              myLeadingDetails(imageVal, currencyName),
              myGraphDetails(data),
              myCurrenciesDetails(
                  currencyVal, currencyPercentage, currencyStatus, colorVal),
            ],)
        ],)
  );
}


Widget myLeadingDetails(String imageVal, String currencyName) {
  return Container(
      child: Row(children: <Widget>[
        Container(child: Image(
          height:50.0,
          image:AssetImage(imageVal),
        ),),
        SizedBox(width: 10.0,),
        Container(child: Text(
          currencyName, style: TextStyle(
            color: Color(0xff3a2483),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 16.0
        ),),),
      ],)
  );
}

Widget myGraphDetails(List<double> data) {
  return Container(
    width: 80.0,
    height: 50.0,
    child: Sparkline(
      data: data,
      lineColor: Color(0xff013db7),
      //fillMode: FillMode.below,
      fillColor: Colors.blue[100],
    ),
  );
}

Widget myCurrenciesDetails(String currencyVal, String currencyPercentage,
    String currencyStatus, int colorVal) {
  return Container(child: Column(
    children: <Widget>[
      Container(child: Text(
          "\u0024" + currencyVal,
          style: TextStyle(
              color: Color(0xff3a2483),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800,
              fontSize: 20.0
          )
      ),),
      Container(child: Text(
          currencyPercentage + "\u0025\u0020" + currencyStatus,
          style: TextStyle(
            color: Color(colorVal),
            fontFamily: 'Poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          )
      ),),
    ],
  ));
}
*/