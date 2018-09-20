import 'package:flutter/material.dart';
import 'profile.dart';

class UserDetailBody extends StatefulWidget {



  @override
  UserDetailBodyState createState() {
    return new UserDetailBodyState();
  }
}

class UserDetailBodyState extends State<UserDetailBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange,
      ),
      body: new Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              color:Colors.orange.withOpacity(0.8),
            ),
            clipper: getClipper(),
          ),
          Positioned(
            width: 400.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children:<Widget>[
                Container(
                  width: 150.0,
                  height :150.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: NetworkImage('https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                        fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(75.0)),
                    boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)]
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Chicago, IL',

                  style: TextStyle(
                    fontSize: 17.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 300.0),
                Container(
                  height: 30.0,
                  width: 95.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Center(
                        child: Text(
                            'Edit Profile',
                          style: TextStyle(color: Colors.white),

                        )
                      ),
                    ),
                  )
                )
              ]
            )
          ),
        ],
      )

    );
  }
}


class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size){
    var path = new Path();

    path.lineTo(0.0, size.height / 2.3);
    path.lineTo(size.width + 150, 0.2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return true;
  }
}