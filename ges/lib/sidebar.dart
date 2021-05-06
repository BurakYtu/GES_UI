import 'dart:io';
import 'package:flutter/material.dart';
import 'mappage.dart';
import 'analyticspage.dart';
import 'infopage.dart';

class SideBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Material(
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
            ),
            ListTile(
              leading: Icon(Icons.analytics, color: Colors.white,),
              title: Text(
                'Analytics',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                ),
              ),
              hoverColor: Colors.white60,
              onTap: () {
                selectedItem(context,0);
              },
            ),
            ListTile(
              leading: Icon(Icons.map_outlined, color: Colors.white,),
              title: Text(
                  'Map',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700
                ),
              ),
              onTap: () {
                selectedItem(context,1);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white,),
              title: Text(
                'Logout',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                ),
              ),
              onTap: () {
                exit(0);
              },
            ),
            //const SizedBox(height: 5,),
            Divider(color: Colors.white60,),
            //const SizedBox(height: 5,),
            ListTile(
              leading: Icon(Icons.info_outline, color: Colors.white,),
              title: Text(
                'Info',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                ),
              ),
              onTap: () {
                selectedItem(context,2);
              },
            ),
          ],
        ),
      )
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AnalyticsPage(),
        ));
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MapPage(),
        ));
        break;

      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => InfoPage(),
        ));
        break;
    }
  }


}