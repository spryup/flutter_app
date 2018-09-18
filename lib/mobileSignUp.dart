import 'package:flutter/material.dart';
import 'enterVerificationCode.dart';


class secondScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar:  new AppBar(
        title : new Text("Mobile Sign up"),
    ),
    body: new Container(
      padding: const EdgeInsets.all(40.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextField(
            decoration: new InputDecoration(labelText: "Enter Your Number"),
            keyboardType: TextInputType.number,
          ),
          new Padding(
              padding: const EdgeInsets.only(top:20.0)
          ),
          new MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => verificationCode())
                );
              },
            height: 40.0,
            minWidth: 100.0,
            color: Colors.teal,
            textColor: Colors.white,
            child: new Text("Sign In"),
            splashColor: Colors.amber,
          ),

        ],
      ),

),
    );
  }
}
