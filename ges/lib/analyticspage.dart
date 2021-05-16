import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    //drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Analytics'),
      centerTitle: true,
      backgroundColor: Color(0XFF34495E),
    ),
    body: Center(
      child: Container(
        width: 300,
        height: 600,
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 1,
          children: [
            FutureBuilder(
              future: _getImage(context, "rgb.jpg"),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return Container(
                    //width: MediaQuery.of(context).size.width / 1.2,
                    //height: MediaQuery.of(context).size.height / 1.2,
                    child: snapshot.data,
                  );
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            ),
            FutureBuilder(
              future: _getImage(context, "thermal.jpg"),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: snapshot.data,
                  );
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    )
  );

  Future<Widget> _getImage(BuildContext context, String imageName) async {
    Image image;
    await FireStorageService.loadImage(context, imageName).then((value){
     image = Image.network(
       value.toString(),
       //height: 200,
       //width: 200,
       //scale: 5,
       fit: BoxFit.fill,
     );
    });
    return image;
  }
}

class FireStorageService extends ChangeNotifier{
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async{
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}