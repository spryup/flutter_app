import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homepage.dart';

class PhoneAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/homepage':(BuildContext context) => DashboardPage(),
        '/landingpage': (BuildContext context) => Home()
      }
    );
  }
}

class Home extends StatefulWidget {



  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String phoneNo;
  String smsCode;
  String verificationId;

  Future<void> verifyPhone() async {

    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
        this.verificationId = verId;

    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {

      this.verificationId = verId;
      smsCodeDialog(context).then((value){
          print('Signed in');
      });

    };

    final PhoneVerificationCompleted verifiedSuccess = (FirebaseUser user) {
       print('verified');
    };

    final PhoneVerificationFailed verifiFailed = (AuthException exception) {
       print('${exception.message}');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.phoneNo,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verifiedSuccess,
        verificationFailed: verifiFailed,
    );

  }
  
  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
      return new AlertDialog(
        title: Text('Enter sms Code'),
        content: TextField(
          onChanged: (value){

          },
        ),
        contentPadding: EdgeInsets.all(10.0),
        actions: <Widget>[
          new FlatButton(
              onPressed: () {
                FirebaseAuth.instance.currentUser().then((user){
                  if(user != null) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  } else {
                    Navigator.of(context).pop();
                    signIn();
                  }
                });
              },
              child: Text('Done'),
          ),
        ],
      );
      },
    );
  }

  signIn() {
    FirebaseAuth.instance
        .signInWithPhoneNumber(
        verificationId: verificationId,
        smsCode: smsCode
    ).then((user){
      Navigator.of(context).pushReplacementNamed('/homepage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Phone Auth test'),
      ),
      body: new Center(
       child: Container(
         padding: EdgeInsets.all(25.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             TextField(
               decoration: InputDecoration(hintText: 'Enter Phone Number'),
               onChanged: (value){
                 this.phoneNo = value;
               },
             ),
             SizedBox(height: 10.0),
             RaisedButton(
               onPressed: verifyPhone,
               child: Text('Verify'),
               textColor: Colors.white,
               elevation: 7.0,
               color: Colors.blue,
             ),
           ],
         ),
       ),
      ),
    );
  }
}
