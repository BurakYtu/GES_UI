import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/src/layer/group_layer.dart';
import 'package:flutter_map/src/layer/overlay_image_layer.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    //drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Map'),
      centerTitle: true,
      backgroundColor: Color(0XFF34495E),
    ),
    body: Container(
      color: Color(0XFF34495E),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text("GES",
           style: TextStyle(
             color: Colors.white,
             fontSize: 20.0,
            ),
          ),
            SizedBox(height: 30.0,),
            DefaultTabController(
              length: 2,
                child: Column(children: [
                  TabBar(
                    indicatorColor: Color(0xFFFFFFFF),
                    unselectedLabelColor: Color(0xFF888888),
                    labelColor: Color(0xFFFFFFFF),
                    labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    tabs: [
                      Tab(
                        text: "Yesterday",
                      ),
                      Tab(
                        text: "Today",
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 300.0,
                    child: TabBarView(
                      children: [
                        Container(
                          child: new FlutterMap(options: new MapOptions(
                              minZoom: 10.0,
                              center: new LatLng(45.71,-74.00)),
                            layers: [new TileLayerOptions(
                                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                subdomains: ['a','b','c']),
                              new MarkerLayerOptions(
                                  markers: [
                                    new Marker(
                                        width: 10.0,
                                        height: 10.0,
                                        point: new LatLng(45.71,-74.00),
                                        builder: (context) => new Container(
                                          child: IconButton(
                                            icon: Icon(Icons.location_on),
                                            color: Colors.green,
                                            iconSize: 45,
                                            onPressed: (){},
                                          ),
                                        )
                                    )
                                  ]
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: new FlutterMap(options: new MapOptions(
                              minZoom: 10.0,
                              center: new LatLng(45.71,-74.00)),
                            layers: [new TileLayerOptions(
                                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                subdomains: ['a','b','c']),
                              new MarkerLayerOptions(
                                  markers: [
                                    new Marker(
                                        width: 10.0,
                                        height: 10.0,
                                        point: new LatLng(45.71,-74.00),
                                        builder: (context) => new Container(
                                          child: IconButton(
                                            icon: Icon(Icons.location_on),
                                            color: Colors.green,
                                            iconSize: 45,
                                            onPressed: (){},
                                          ),
                                        )
                                    ),
                                    new Marker(
                                        width: 10.0,
                                        height: 10.0,
                                        point: new LatLng(45.715,-74.005),
                                        builder: (context) => new Container(
                                          child: IconButton(
                                            icon: Icon(Icons.location_on),
                                            color: Colors.red,
                                            iconSize: 45,
                                            onPressed: (){},
                                          ),
                                        )
                                    )
                                  ]
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
                ),
            )
          ]
        ),
    )
  );
}