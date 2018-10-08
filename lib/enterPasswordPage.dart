import 'package:flutter/material.dart';
import 'mapPage.dart';

class enterPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Enter password"),
        backgroundColor: Colors.orange,
      ),
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextFormField(
              decoration: new InputDecoration(
                  labelText: "New password",

              ),
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Confirm password",

              ),
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            new Padding(
                padding: const EdgeInsets.only(top:20.0)
            ),
            new MaterialButton(
                height: 40.0,
                minWidth: 100.0,
                color: Colors.teal,
                textColor: Colors.white,
                child: new Text("Enter"),
                splashColor: Colors.amber,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapPage()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
