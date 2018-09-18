import 'package:flutter/material.dart';
import 'enterPasswordPage.dart';

class verificationCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("verification code"),
      ),
        body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(labelText: "Enter your verification code"),
                keyboardType: TextInputType.number,
              ),
              new Padding(
                  padding: const EdgeInsets.only(top:20.0)
              ),
              new MaterialButton(
                  height: 40.0,
                  minWidth: 100.0,
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: new Text("next"),
                  splashColor: Colors.amber,
                  onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => enterPassword()),
                );
              }),
            ],
          )
        ),

    );
  }
}
