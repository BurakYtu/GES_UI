import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {

  final double barHeight = 66.0;
  const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Solar Panel Data',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 20.0
              ),
            ),
          ),),

          Container(child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.announcement_outlined, color: Colors.white,),
          ),),
        ],
      ),
      decoration: new BoxDecoration(
        color: Color(0XFF34495E)
      ),
    );
  }
}