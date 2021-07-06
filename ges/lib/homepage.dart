import 'package:flutter/material.dart';
import 'myflexiableappbar.dart';
import 'myappbar.dart';
import 'package:ges/sidebar.dart';
import 'detail_1_page.dart';
import 'detail_2_page.dart';
import 'detail_3_page.dart';
import 'detail_4_page.dart';
import 'detail_5_page.dart';
import 'detail_6_page.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  static const List<List<String>> PVSections = [
    [
      'https://senerji.istanbul/wp-content/uploads/2021/03/roof-top-solar-1-1170x820-1.jpg',
      'Herşey Güzel Görünüyor',
      '1',
    ],
    [
      'https://socalsolarpro.com/wp-content/uploads/2017/05/Solar-Bird-Poop-Cleaning.jpg',
      'Martılar Basmış !!!',
      '2',
    ],
    [
      'https://4.imimg.com/data4/KE/MP/MY-16227556/thermalimage1_solarpanel1_iz-500x500.jpg',
      'Etek Temizliği Lazım',
      '3',
    ],
    [
      'http://www.bdg-usa.com/wp-content/uploads/2017/06/drone-thermal-imaging-solar-panel-inspection-2-300x240.jpg',
      'Doğu Taraf Yanıyor Hadi iyisin',
      '4',
    ],
    [
      'https://abjdrones.com/wp-content/uploads/2018/04/Thermal-Solar-Panel-Inspection-Services_2.jpg',
      'HotSpot mu o?',
      '5',
    ],
    [
      'https://images.theecoexperts.co.uk/wp-content/uploads/2020/03/solar-thermal-1.jpeg',
      'İki Panel için yordun beni',
      '6',
    ]
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0XFF34495E),
      drawer: SideBar(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: new Alignment(-1.0, -0.1),
              end: new Alignment(1.0, 0.5),
              colors: [
                const Color(0xFF898989),
                const Color(0xFF303030),
              ],
              stops: [
                0.0,
                1.0,
              ],
            )
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 25),
              height: 150,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    //height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFFffffff),
                            const Color(0xFFa8a8a8),
                          ]
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.75),
                          blurRadius: 20.0,
                          spreadRadius: 5.0,
                          offset: Offset(1.0, 1.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 320,
              width: 300,
              child: Container(
                child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 70,
                        width: 300,
                        child: Container(
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 70,
                        width: 300,
                        child: Container(
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 70,
                        width: 300,
                        child: Container(
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 70,
                        width: 300,
                        child: Container(
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ]
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}


Card _buildListItem(BuildContext context, List<String> PVstatus) {

  void sec(){
    switch(PVstatus[2]){
      case '1':{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_1_Page()));
      }
      break;
      case '2':{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_2_Page()));
      }
      break;
      case '3':{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_3_Page()));
      }
      break;
      case '4':{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_4_Page()));
      }
      break;
      case '5':{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_5_Page()));
      }
      break;
      case '6':{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_6_Page()));
      }
      break;
      default:{}
      break;
    }
  }

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
            new FlatButton(key:null, onPressed: sec,
              child: null,color: Colors.transparent,height: 125,minWidth: 350,),
          ]
      )
  );
}

/*
new Image.network(
                        'https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png',
                        fit:BoxFit.fill,
                        width: 100.0,
                        height: 100.0,
                      ),
 */