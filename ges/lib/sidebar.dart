import 'package:flutter/material.dart';

class SideBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Container(
        color: Color(0XFF34495E),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                '4X ARGE GES',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 21
                ),),
              accountEmail: Text(
                'info@4xarge.com',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14
                ),),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image(image: AssetImage('assets/fourx.PNG'),
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/plant.PNG'),
                      fit: BoxFit.cover
                  )
              ),
            )
          ],
        ),
      )
    );
  }
}