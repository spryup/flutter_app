import 'package:flutter/material.dart';

import 'profile_picture.dart';

class widgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        title: new Text("test page"),
      ),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          skillDisplay()
        ],

      ),

    );
  }
}
