import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



void main() => runApp(new FlutterChatApp());

class FlutterChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Chat Screen'),
      ),
    );
  }
}