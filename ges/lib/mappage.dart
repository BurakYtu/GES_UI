import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:lat_lon_grid_plugin/lat_lon_grid_plugin.dart';
import 'analyticspage.dart';

class MapPage extends StatelessWidget {

  var points = <LatLng>[
    new LatLng(38.395883, 34.975348),
    new LatLng(38.396343, 34.976836),
    new LatLng(38.395459, 34.977477),
    new LatLng(38.395202, 34.976798),
    new LatLng(38.395237, 34.975824),
    new LatLng(38.395883, 34.975348),
  ];

  var points2 = <LatLng>[
    new LatLng(38.394595, 34.974125),
    new LatLng(38.394930, 34.975452),
    new LatLng(38.394055, 34.975989),
    new LatLng(38.393589, 34.974473),
    new LatLng(38.394595, 34.974125),
  ];

  var points3 = <LatLng>[
    new LatLng(38.394197, 34.977613),
    new LatLng(38.394300, 34.979288),
    new LatLng(38.393220, 34.979462),
    new LatLng(38.393123, 34.977845),
    new LatLng(38.394197, 34.977613),
  ];

  var points4 = <LatLng>[
    new LatLng(38.393339, 34.974698),
    new LatLng(38.393350, 34.976294),
    new LatLng(38.393061, 34.976286),
    new LatLng(38.393049, 34.975989),
    new LatLng(38.392731, 34.975960),
    new LatLng(38.392703, 34.976286),
    new LatLng(38.392288, 34.976279),
    new LatLng(38.392254, 34.974713),
    new LatLng(38.393339, 34.974698),
  ];

  var points5 = <LatLng>[
    new LatLng(38.392401, 34.972617),
    new LatLng(38.392697, 34.973009),
    new LatLng(38.392106, 34.973886),
    new LatLng(38.392003, 34.975068),
    new LatLng(38.391196, 34.974488),
    new LatLng(38.391617, 34.973310),
    new LatLng(38.392401, 34.972617),
  ];

  var points6 = <LatLng>[
    new LatLng(38.392003, 34.975365),
    new LatLng(38.391884, 34.976932),
    new LatLng(38.391236, 34.977048),
    new LatLng(38.391088, 34.975358),
    new LatLng(38.391384, 34.974923),
    new LatLng(38.391743, 34.975316),
    new LatLng(38.392003, 34.975365),
  ];

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
            Text("Kayseri GES",
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
                    height: 350.0,
                    child: TabBarView(
                      children: [
                        Container(
                          child: new FlutterMap(
                            options: new MapOptions(
                              minZoom: 16,
                              maxZoom: 50,
                              center: new LatLng(38.393861, 34.976809),
                              plugins: [
                                MapPluginLatLonGrid(),
                              ],
                          ),
                            layers: [new TileLayerOptions(
                              urlTemplate: 'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw',
                                additionalOptions: {
                                  'id': 'mapbox.satellite'
                                }
                                //urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                //subdomains: ['a','b','c']
                            ),//
                              /*MapPluginLatLonGridOptions(
                                lineColor: Colors.black38,
                                textColor: Colors.white,
                                lineWidth: 0.5,
                                textBackgroundColor: Colors.black54,
                                showCardinalDirections: true,
                                showCardinalDirectionsAsPrefix: false,
                                textSize: 10.0,
                                showLabels: true,
                                rotateLonLabels: true,
                                placeLabelsOnLines: true,
                                offsetLonTextBottom: 20.0,
                                offsetLatTextLeft: 20.0,
                              ),*/
                              new PolygonLayerOptions(
                                  polygons: [
                                    new Polygon(
                                      points: points,
                                      borderStrokeWidth: 2.0,
                                      color: Colors.red.withOpacity(0.2),
                                      borderColor: Colors.white,
                                    ),
                                  ]
                              ),
                              new MarkerLayerOptions(
                                  markers: [
                                    new Marker(
                                        point: new LatLng(38.396343, 34.976836),
                                        builder: (context) => new Container(
                                          child: IconButton(
                                            icon: Icon(Icons.location_on),
                                            color: Colors.pink.withOpacity(0.7),
                                            iconSize: 50,
                                            onPressed: (){
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (builder){
                                                    return Container(
                                                      color: Colors.white,
                                                        child: new Center(
                                                          child: new Text("Details"),
                                                        ),
                                                    );
                                                  },
                                              );
                                            },
                                          ),
                                        )
                                    )
                                  ]
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: new FlutterMap(
                            options: new MapOptions(
                              minZoom: 16,
                              maxZoom: 50,
                              center: new LatLng(38.393861, 34.975809),
                          ),
                            layers: [
                              new TileLayerOptions(
                                urlTemplate: 'https://api.mapbox.com/styles/v1/burakgzl/ckod79pe10j3b17olhtqngf18/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYnVyYWtnemwiLCJhIjoiY2tvZDc0bm0wMHhhYjJ4b2RkNnZqMXBtaSJ9.mFmYbfjJGySQe1fAzc3O4Q', //http://{s}.tile.openstreetmap.de/tiles/osmde/{z}/{x}/{y}.png
                                additionalOptions: {
                                  'accessToken' : 'pk.eyJ1IjoiYnVyYWtnemwiLCJhIjoiY2tvZDc4ZDZiM3hldTJwbXZscjZreHA2dCJ9.YNBMFtlCdue00yCopDIsxg',
                                  'id': 'mapbox.mapbox-streets-v8'
                                }
                            ),
                              new PolylineLayerOptions(
                                polylines: [
                                  new Polyline(
                                    points: points,
                                    strokeWidth: 2.0,
                                    color: Colors.red,
                                  ),
                                  new Polyline(
                                    points: points2,
                                    strokeWidth: 2.0,
                                    color: Colors.red,
                                  ),
                                  new Polyline(
                                    points: points3,
                                    strokeWidth: 2.0,
                                    color: Colors.green,
                                  ),
                                  new Polyline(
                                    points: points4,
                                    strokeWidth: 2.0,
                                    color: Colors.green,
                                  ),
                                  new Polyline(
                                    points: points5,
                                    strokeWidth: 2.0,
                                    color: Colors.green,
                                  ),
                                  new Polyline(
                                    points: points6,
                                    strokeWidth: 2.0,
                                    color: Colors.red,
                                  )
                                ]
                              ),
                              new MarkerLayerOptions(
                                  markers: [
                                    new Marker(
                                        width: 40.0,
                                        height: 40.0,
                                        point: new LatLng(38.395883, 34.975348),
                                        builder: (context) => new Container(
                                          child: IconButton(
                                            icon: Icon(Icons.info),
                                            color: Colors.red,
                                            iconSize: 40,
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => AnalyticsPage(),
                                              ));
                                            },
                                          ),
                                        )
                                    ),
                                    new Marker(
                                        width: 40.0,
                                        height: 40.0,
                                        point: new LatLng(38.394595, 34.974125),
                                        builder: (context) => new Container(
                                          child: IconButton(
                                            icon: Icon(Icons.info),
                                            color: Colors.red,
                                            iconSize: 40,
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => AnalyticsPage(),
                                              ));
                                            },
                                          ),
                                        )
                                    ),
                                    new Marker(
                                        width: 40.0,
                                        height: 40.0,
                                        point: new LatLng(38.394197, 34.977613),
                                        builder: (context) => new Container(
                                          child: IconButton(
                                            icon: Icon(Icons.assignment_turned_in_rounded),
                                            color: Colors.green,
                                            iconSize: 40,
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => AnalyticsPage(),
                                              ));
                                            },
                                          ),
                                        )
                                    ),
                                    new Marker(
                                        width: 40.0,
                                        height: 40.0,
                                        point: new LatLng(38.393339, 34.974698),
                                        builder: (context) => new Container(
                                          child: IconButton(
                                            icon: Icon(Icons.assignment_turned_in_rounded),
                                            color: Colors.green,
                                            iconSize: 40,
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => AnalyticsPage(),
                                              ));
                                            },
                                          ),
                                        )
                                    ),
                                    new Marker(
                                        width: 40.0,
                                        height: 40.0,
                                        point: new LatLng(38.392401, 34.972617),
                                        builder: (context) => new Container(
                                          child: IconButton(
                                            icon: Icon(Icons.assignment_turned_in_rounded),
                                            color: Colors.green,
                                            iconSize: 40,
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => AnalyticsPage(),
                                              ));
                                            },
                                          ),
                                        )
                                    ),
                                    new Marker(
                                        width: 40.0,
                                        height: 40.0,
                                        point: new LatLng(38.392003, 34.975365),
                                        builder: (context) => new Container(
                                          child: IconButton(
                                            icon: Icon(Icons.info),
                                            color: Colors.red,
                                            iconSize: 40,
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => AnalyticsPage(),
                                              ));
                                            },
                                          ),
                                        )
                                    ),
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