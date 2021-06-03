import 'package:flutter/material.dart';
import 'package:ges/main.dart';
import 'analyticspage.dart';
import 'myflexiableappbar.dart';
import 'myappbar.dart';
import 'package:ges/sidebar.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  static const List<List<String>> PVSections = [
    [
      'https://senerji.istanbul/wp-content/uploads/2021/03/roof-top-solar-1-1170x820-1.jpg',
      'Herşey Güzel Görünüyor',
    ],
    [
      'https://socalsolarpro.com/wp-content/uploads/2017/05/Solar-Bird-Poop-Cleaning.jpg',
      'Martılar Basmış !!!',
    ],
    [
      'https://4.imimg.com/data4/KE/MP/MY-16227556/thermalimage1_solarpanel1_iz-500x500.jpg',
      'Etek Temizliği Lazım',
    ],
    [
      'http://www.bdg-usa.com/wp-content/uploads/2017/06/drone-thermal-imaging-solar-panel-inspection-2-300x240.jpg',
      'Doğu Taraf Yanıyor Hadi iyisin',
    ],
    [
      'https://abjdrones.com/wp-content/uploads/2018/04/Thermal-Solar-Panel-Inspection-Services_2.jpg',
      'HotSpot mu o?',
    ],
    [
      'https://images.theecoexperts.co.uk/wp-content/uploads/2020/03/solar-thermal-1.jpeg',
      'İki Panel için yordun beni',
    ]
  ];

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
            return _buildListItem(context, PVSections[index]);
          },
          childCount: 6,),
          ),
        ],
      ),
    );
  }
}


Card _buildListItem(BuildContext context, List<String> PVstatus) {
  return Card(
    margin: const EdgeInsets.all(5),
    child: new Stack(
        children: <Widget>[
          new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Image.network(
                  PVstatus[0],
                  fit:BoxFit.fill,
                  width: 125.0,
                  height: 125.0,
                ),
                new Text(
                  PVstatus[1],
                  style: new TextStyle(fontSize:18.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                )
              ]
          ),
          new FlatButton(key:null, onPressed: ()=>{Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AnalyticsPage()),
          )}, child: null,color: Colors.transparent,height: 125,minWidth: 350,),
        ]
    )
  );
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