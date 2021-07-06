import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:ges/sidebar.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<charts.Series<Task, String>> _seriesPieData;

  _generateData() {

    var piedata = [
      new Task('Work', 35.8, Color(0xff3366cc)),
      new Task('Eat', 8.3, Color(0xff6789cd)),
      new Task('Commute', 10.8, Color(0xff8097c4)),
      new Task('TV', 15.6, Color(0xffaab5c9)),
      new Task('Sleep', 19.2, Color(0xffbdc1cb)),
      new Task('Other', 10.3, Color(0xffd9d9d9)),
    ];

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

  var data = [0.2, 0.1, 0.12, 0.31, 0.16, 0.21, 0.7, 0.19, 0.4, 0.08, 0.43];
  var data2 = [0.0, 0.2, 0.3, 0.42, 0.73, 0.89, 1.1, 1.8, 1.99, 2.39, 2.47, 2.9];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
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
                      width: size.height*0.3,
                      child: charts.PieChart(
                          _seriesPieData,
                          animate: true,
                          animationDuration: Duration(seconds: 1),
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
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                            child: Column(
                              children: <Widget>[
                                Text("Overall"),
                                Text("Efficiency"),
                                SizedBox(height: 30,),
                                Text("Sunday"),
                                Text("Monday"),
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
                    ),
                    SizedBox(height: 20),
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      height: size.height*0.1,
                    ),
                    SizedBox(height: 20),
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      height: size.height*0.1,
                    ),
                    SizedBox(height: 20),
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      height: size.height*0.1,
                    ),
                    SizedBox(height: 20),
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      height: size.height*0.1,
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
                    SizedBox(width: 20),
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      width: size.height*0.25,
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

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}