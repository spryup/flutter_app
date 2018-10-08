import 'package:flutter/material.dart';
import 'mobileSignUp.dart';
import 'mapPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue
      )
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{



  @override


  Widget build(BuildContext context) {
    return new Scaffold(
       backgroundColor: Colors.lightGreenAccent,
       body: new Stack(
         fit: StackFit.expand,
         children: <Widget>[
           new Image(
              image: new AssetImage("assets/image1.jpg"),
             fit: BoxFit.cover,
             color: Colors.lightGreenAccent,
             colorBlendMode: BlendMode.colorBurn,
           ),
           new Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               new FlutterLogo(
                 size: 100.0,
               ),
               new Form (
                 child: new Theme(
                   data: new ThemeData(
                     brightness: Brightness.dark,
                     primarySwatch: Colors.teal,
                     inputDecorationTheme: new InputDecorationTheme(
                       labelStyle: new TextStyle(
                         color: Colors.teal,
                         fontSize: 20.0,
                       )
                     ),
                   ),
                   child: Container(
                     padding: const EdgeInsets.all(40.0),
                     child: new Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         new TextFormField(
                           decoration: new InputDecoration(
                               labelText: "Enter Mobile Number"
                           ),
                           keyboardType: TextInputType.phone,
                         ),
                         new TextFormField(
                           decoration: new InputDecoration(
                               labelText: "Enter Password"
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
                             child: new Text("Login"),
                              onPressed: () {
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => MapPage())
                             );
                           },
                             splashColor: Colors.amber,

                         ),
                         new Padding(
                             padding: const EdgeInsets.only(top:20.0)
                         ),
                         new MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => secondScreen())
                              );
                            },
                           height: 40.0,
                           minWidth: 100.0,
                           color: Colors.teal,
                           textColor: Colors.white,
                           child: new Text("Sign Up"),
                           splashColor: Colors.amber,
                         )
                       ],
                     ),
                   ),
                 )
               )

             ],
           )
         ],
       ),
    );
  }
}

