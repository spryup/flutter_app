import 'package:flutter/material.dart';

//profile picture

class profilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150.0,
        height: 150.0,

        decoration: BoxDecoration(
          color: Colors.teal,
//          gradient: LinearGradient(
//            colors: [
//              const Color(0xFF001510),
//              const Color(0x0000bf8f),
//            ],
//          ),
          image:DecorationImage(
              image: NetworkImage(''),
              fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.all(Radius.circular(75.0)),

        ),
    );
  }
}


//skill level display

class skillDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.0,
      height: 10.0,
      color: Colors.teal,


    );
  }
}
