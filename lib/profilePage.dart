import 'package:flutter/material.dart';
import 'profile.dart';

class UserDetailBody extends StatelessWidget {

  bodyWidget(BuildContext context) => Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width - 20,
        left: 10.0,
        top: MediaQuery.of(context).size.height * 0.1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              Text(
                'John Doe',
                style:
                TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              Text("Chicago"),
              Text(""),
              Text(
                "About Me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              ),
              Text("Interests",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              ),
              Text("Next Evolution",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: 'name',
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(

              ),

            )),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange,
        title: new Text('Profile Page'),
      ),
      body: bodyWidget(context),
      
    );
  }
}
