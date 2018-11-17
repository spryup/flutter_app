import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(

      appBar: new AppBar(
        centerTitle: true,
        elevation: 1.0,
        title: new Text('Name'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          OverlayStack(),
        ],
      ),
    );
  }
}

///Cover picture and profile picture

//TODO: Pass urls of pictures as parameters
Widget OverlayStack() {
  return new Stack(
    children: <Widget>[
      new Column(
        children: <Widget>[

               new Container(
                height: 300.0,  //TODO: height should change according to the screen size
                 width: 450.0,
                 margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                 decoration: new BoxDecoration(
                   image: new DecorationImage(

                       image: new NetworkImage('https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                       fit: BoxFit.cover,
                   )
                 ),
                 child: new BackdropFilter(
                     filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                   child: new Container(
                     decoration: new BoxDecoration(
                       color: Colors.black.withOpacity(0.2),
                     ),
                   ),
                 ) ,

            ),



        ],
      ),
     new Column(
       children: <Widget>[
         new Container(
           alignment: Alignment.topCenter,
           padding: new EdgeInsets.only(
             top: 20.0,
             right :20.0,
             left: 20.0,

           ),
           child: new Container(
             height: 200.0,
             width: 200.0,
             margin: const EdgeInsets.fromLTRB(10.0, 15.0, 30.0, 30.0),
             child: new CircleAvatar(
               child: new Container(
                 decoration: new BoxDecoration(
                   image: new DecorationImage(
                       image: new NetworkImage('https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg')
                   ),
                   borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
                 ),

               ),

             ),
           ),
         ),
              NumOfMiles(5),
       ],

     ),
    ],
  );
}


//No of miles away widget

Widget NumOfMiles(int num_of_miles) {

  return new RichText(
    text: TextSpan(
      text:'${num_of_miles} Miles',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,


      ),
    ),

  );

}