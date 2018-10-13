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
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
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
                _buildActionButtons(),
                _buildFollowerInfo(textTheme),
                new Padding(
                  padding: const EdgeInsets.only(
                      top:10.0,
                      left: 8.0,

                  ),
                  child: new Text('John Dow',
                    style: textTheme.headline.copyWith(color: Colors.grey),
                  ),
                ),
                new Padding(
                    padding: const EdgeInsets.only(
                        top:6.0
                    ),
                    child: _buildLocationInfo(textTheme),
                ),
               textSection,
              ]
            )
          ),
        ],
      )

    );
  }
}



Widget _createPillButton(
    String text, {
      Color backgroundColor = Colors.transparent,
      Color textColor = Colors.white70,
    }) {
  return new Container(
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
              child: new Text(text,style: TextStyle(color: Colors.white)),
          ),
        ),
      )
  );
}

//interests

Widget _interest(
    String text, {
  Color backgroundColor = Colors.transparent,
  Color textColor = Colors.white70,
}) {



}


Widget textSection = Container(
  padding: const EdgeInsets.all(32.0),
  child : Text('Lorem Ipsum is simply dummy text of the printing and typesetting '
      'industry. Lorem Ipsum has been the industry\'s standard dummy '
      'text ever since the 1500s.',
      softWrap: true,
      style: TextStyle(color: Colors.grey)
      ),

);

Widget _buildActionButtons() {
  return new Padding(
    padding: const EdgeInsets.only(
      top: 18.0,
      left: 16.0,
      right: 16.0,
    ),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _createPillButton(
          'CONNECT',
        ),
        new DecoratedBox(
          decoration: new BoxDecoration(
            border: new Border.all(color: Colors.white30),
            borderRadius: new BorderRadius.circular(30.0),
          ),
          child: _createPillButton(
            'FOLLOW',
            textColor: Colors.white70,
          ),
        ),
      ],
    ),
  );
}

Widget _buildFollowerInfo(TextTheme textTheme) {
  var followerStyle =
  textTheme.subhead.copyWith(color: Colors.grey);

  return new Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text('90 Following', style: followerStyle),
        new Text(
          ' | ',
          style: followerStyle.copyWith(
              fontSize: 24.0, fontWeight: FontWeight.normal),
        ),
        new Text('100 Followers', style: followerStyle),
      ],
    ),
  );
}


Widget _buildLocationInfo(TextTheme textTheme) {
  return new Row(
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: new Icon(
          Icons.place,
          color: Colors.grey,
          size: 16.0,
        ),
      ),

      new Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: new Text(
          'Chicago,IL',
          style: textTheme.subhead.copyWith(color: Colors.grey),
        ),
      ),
    ],
  );
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