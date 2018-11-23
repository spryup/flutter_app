import 'package:flutter/material.dart';
import 'mobileSignUp.dart';
import 'mapPage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

void main() => runApp(new MyApp());

Future<String> _testSignInWithGoogle() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth =
  await googleUser.authentication;
  final FirebaseUser user = await _auth.signInWithGoogle(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  assert(user.email != null);
  assert(user.displayName != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  print("This user is singed in $user");

  return 'signInWithGoogle succeeded: $user';
}

//Google Sign in
Future<FirebaseUser> _signIn() async{
  GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

  FirebaseUser user = await _auth.signInWithGoogle(
      idToken: gSA.idToken,
      accessToken: gSA.accessToken,
  );

  print("user name : ${user.displayName}");
}


//Google sign Out
void _signOut() {
  _googleSignIn.signOut();
  print("user signed out");
}

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
                         ),
                         new Padding(
                             padding: const EdgeInsets.only(top:20.0)
                         ),
                         new MaterialButton(
                             height: 40.0,
                             minWidth: 100.0,
                             color: Colors.teal,
                             textColor: Colors.white,
                             child: new Text("SignIn with Google"),
                             splashColor: Colors.amber,
                             onPressed: () {
                               _testSignInWithGoogle();
                               Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => MapPage())
                               );

                             }
                         ),
                         new Padding(
                             padding: const EdgeInsets.only(top:20.0)
                         ),
                         new MaterialButton(
                             height: 40.0,
                             minWidth: 100.0,
                             color: Colors.teal,
                             textColor: Colors.white,
                             child: new Text("Google Test SignOut"),
                             splashColor: Colors.amber,
                             onPressed: _signOut,
                         ),
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

