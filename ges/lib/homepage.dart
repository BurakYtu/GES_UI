import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:ges/sidebar.dart';
import 'detail_1_page.dart';
import 'detail_2_page.dart';
import 'detail_3_page.dart';
import 'detail_4_page.dart';
import 'detail_5_page.dart';
import 'detail_6_page.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<charts.Series<Pollution, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;

  _generateData() {

    var data1 = [
      new Pollution(1980, 'East', 30),
      new Pollution(1980, 'West', 40),
      new Pollution(1980, 'South', 10),
    ];
    var data2 = [
      new Pollution(1985, 'East', 100),
      new Pollution(1980, 'West', 150),
      new Pollution(1985, 'South', 80),
    ];
    var data3 = [
      new Pollution(1985, 'East', 200),
      new Pollution(1980, 'West', 300),
      new Pollution(1985, 'South', 180),
    ];

    var piedata = [
      new Task('Hot Spot', 35.8, Color(0xff3366cc)),
      new Task('Dirt', 8.3, Color(0xff6789cd)),
      new Task('Shit', 10.8, Color(0xff8097c4)),
      new Task('Wheader', 15.6, Color(0xffaab5c9)),
      new Task('Cloud', 19.2, Color(0xffbdc1cb)),
      new Task('Other', 10.3, Color(0xffd9d9d9)),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff3366cc)),
      ),
    );
    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2018',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffaab5c9)),
      ),
    );
    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2019',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffd9d9d9)),
      ),
    );


    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  static const List<List<String>> PVSections = [
    [
      'https://westerninfrared.com/wp-content/uploads/2014/11/Solar-panel.png',
      'Abnormal Temperatures',
      '41.052350, 29.011934',
      '1',
    ],
    [
      'https://senerji.istanbul/wp-content/uploads/2021/03/roof-top-solar-1-1170x820-1.jpg',
      'Clear',
      'West Side',
      '2',
    ],
    [
      'https://abjdrones.com/wp-content/uploads/2018/04/Thermal-Solar-Panel-Inspection-Services_2.jpg',
      'Hot Spot Detected',
      '41.052350, 29.011934',
      '3',
    ],
    [
      'http://www.bdg-usa.com/wp-content/uploads/2017/06/drone-thermal-imaging-solar-panel-inspection-2-300x240.jpg',
      'Above average',
      'East Side',
      '4',
    ],
  ];

  var data = [0.2, 0.1, 0.12, 0.31, 0.16, 0.21, 0.7, 0.19, 0.4, 0.08, 0.43];
  var data2 = [0.0, 0.2, 0.3, 0.42, 0.73, 0.89, 1.1, 1.8, 1.99, 2.39, 2.47, 2.9];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesData = List<charts.Series<Pollution, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Center(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(onPressed: (){}, icon: Icon(Icons.mail_outline, size:20, color: Colors.white)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.access_time_rounded, size:20, color: Colors.white)),
                  SizedBox(width: 50),
                  IconButton(onPressed: (){}, icon: Icon(Icons.account_tree_rounded, size:20, color: Colors.white)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.add_call, size:20, color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Center(
          child: Icon(
            Icons.add,
            size: 32.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
        },
      ),
      backgroundColor: Colors.white,
      drawer: SideBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: size.height,
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
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 0.0,
                ),
                height: size.height * 0.2,
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
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: size.width*0.6,
                      child: charts.PieChart(
                          _seriesPieData,
                          animate: true,
                          animationDuration: Duration(seconds: 2),
                          behaviors: [
                            new charts.DatumLegend(
                              outsideJustification: charts.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 2,
                              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                              entryTextStyle: charts.TextStyleSpec(
                                  color: charts.MaterialPalette.purple.shadeDefault,
                                  fontFamily: 'Georgia',
                                  fontSize: 11),
                            )
                          ],
                          defaultRenderer: new charts.ArcRendererConfig(
                              arcWidth: 20,
                              arcRendererDecorators: [
                                new charts.ArcLabelDecorator(
                                    labelPosition: charts.ArcLabelPosition.outside)
                              ]
                          )
                      ),
                    ),
                    Container(
                      height: size.height * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Center(
                            child: Column(
                              children: <Widget>[
                                Text("Weekly", style: TextStyle(fontSize: 20),),
                                Text("Saved", style: TextStyle(fontSize: 20),),
                                SizedBox(height: 10,),
                                Text(
                                    "\u002B24.93\u0025",
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontFamily: 'Poppins',
                                        fontSize: 25.0
                                    )
                                ),
                              ],
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: 10.0,
                  top: 30.0,
                ),
                height: size.height*0.3,
                width: size.width*0.75,
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      height: size.height*0.1,
                      child: _buildListItem(context, PVSections[0]),
                    ),
                    SizedBox(height: 15),
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      height: size.height*0.1,
                      child: _buildListItem(context, PVSections[1]),
                    ),
                    SizedBox(height: 15),
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      height: size.height*0.1,
                      child: _buildListItem(context, PVSections[2]),
                    ),
                    SizedBox(height: 15),
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      height: size.height*0.1,
                      child: _buildListItem(context, PVSections[3]),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: 20.0,
                  top: 10.0,
                ),
                height: size.height*0.25,
                width: size.width*0.75,
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      width: size.height*0.25,
                      child: charts.BarChart(
                        _seriesData,
                        animate: true,
                        barGroupingType: charts.BarGroupingType.grouped,
                        //behaviors: [new charts.SeriesLegend()],
                        animationDuration: Duration(seconds: 2),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      width: size.height*0.25,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 30.0,
                          top: 30.0,
                        ),
                        child: new Sparkline(
                          data: data,
                          lineColor: Colors.white,
                          pointsMode: PointsMode.last,
                          pointSize: 8.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      width: size.height*0.25,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 30.0,
                          top: 30.0,
                        ),
                        child: new Sparkline(
                          data: data2,
                          fillMode: FillMode.below,
                          fillGradient: new LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.lightBlueAccent,Colors.blueGrey]
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }
}

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

Card _buildListItem(BuildContext context, List<String> PVstatus) {

  void sec(){
    switch(PVstatus[3]){
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
      default:{}
      break;
    }
  }

  return Card(
      color: Colors.transparent,
      margin: EdgeInsets.zero,
      child: Stack(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    PVstatus[0],
                    fit:BoxFit.fitWidth,
                    width: 100.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            PVstatus[1],
                            style: new TextStyle(fontSize:13.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            PVstatus[2],
                            style: new TextStyle(fontSize:12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
            ),
            FlatButton(key:null, onPressed: sec,
              child: null,color: Colors.transparent,height: 125,minWidth: 350,),
          ]
      )
  );
}