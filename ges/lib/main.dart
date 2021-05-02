import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: gesui(),
  ));
}

class gesui extends StatefulWidget {
  @override
  _gesuiState createState() => _gesuiState();
}

class _gesuiState extends State<gesui> {
  int _counter = 0;
  int firabasedata = 0;
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  final plantimage = 'assets/plant.PNG';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 160.0,
            backgroundColor: Color(0xFFFFF700),
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/plant.PNG'),
                fit: BoxFit.fitWidth,
              ),
                title: Text('4X ARGE GES'),
                centerTitle: true,
            ),
            leading: Icon(Icons.menu),
            actions: [
              Icon(Icons.settings),
              SizedBox(width: 12,)
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
