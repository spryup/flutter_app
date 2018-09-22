import 'package:flutter/material.dart';
import 'profilePage.dart';
import 'inbox.dart';
import 'main.dart';
import 'profile.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() {
    return new MapPageState();
  }
}

class MapPageState extends State<MapPage> {
  @override

  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {


  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange,
        title: new Text("Seach Map"),

      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text('John Doe'),
                accountEmail: new Text('jd@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.black26,

                backgroundImage: NetworkImage('https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
              ),
              decoration: new BoxDecoration(
                color: Colors.orange
              ),
            ),
            new ListTile(
              title: new Text("Profile"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserDetailBody())
                );
              },

            ),

            new ListTile(
              title: new Text("inbox"),
              trailing: new Icon(Icons.message),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InboxPage())
                );
                },

            ),
            new ListTile(
              title: new Text("sign Out"),
              trailing: new Icon(Icons.error_outline),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp())
                );
              },

            )
          ],
        ),
      ),


    );
  }
}
