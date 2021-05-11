import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:lat_lon_grid_plugin/lat_lon_grid_plugin.dart';

class MapPage extends StatelessWidget {

  var points = <LatLng>[
    new LatLng(38.395883, 34.975348),
    new LatLng(38.396343, 34.976836),
    new LatLng(38.395459, 34.977477),
    new LatLng(38.395202, 34.976798),
    new LatLng(38.395237, 34.975824),
    new LatLng(38.395883, 34.975348),
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
                              minZoom: 15.5,
                              center: new LatLng(38.393861, 34.976809),
                              plugins: [
                                MapPluginLatLonGrid(),
                              ],
                          ),
                            layers: [new TileLayerOptions(
                                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                subdomains: ['a','b','c']
                            ),
                              MapPluginLatLonGridOptions(
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
                              ),
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
                                        width: 10.0,
                                        height: 10.0,
                                        point: new LatLng(38.3947500, 34.9781250),
                                        builder: (context) => new Container(
                                          child: IconButton(
                                            icon: Icon(Icons.location_on),
                                            color: Colors.orange,
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
                              minZoom: 15.5,
                              center: new LatLng(38.393861, 34.976809),
                          ),
                            layers: [new TileLayerOptions(
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
                                    color: Colors.blue,
                                  )
                                ]
                              ),
                              new MarkerLayerOptions(
                                  markers: [
                                    new Marker(
                                        width: 10.0,
                                        height: 10.0,
                                        point: new LatLng(38.392861, 34.972809),
                                        builder: (context) => new Container(
                                          child: IconButton(
                                            icon: Icon(Icons.location_on),
                                            color: Colors.red,
                                            iconSize: 45,
                                            onPressed: (){},
                                          ),
                                        )
                                    ),
                                    new Marker(
                                        width: 10.0,
                                        height: 10.0,
                                        point: new LatLng(38.3947500, 34.9781250),
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