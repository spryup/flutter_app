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
          CoverPicture("https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
        ],
      ),
    );
  }
}

//Cover picture

Widget CoverPicture(String url) {
  return new Flexible(
    fit: FlexFit.loose,
    child: new Image.network(
      url,
      fit: BoxFit.cover,
    ),
  );
}