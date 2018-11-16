import 'package:flutter/material.dart';

import 'profile_picture.dart';

class widgetTest extends StatelessWidget {
  @override
//TODO: Implement "slide to dismiss" method
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(

      ),
      body: ListView.builder(
        itemCount: 5,
          itemBuilder: (context,int) {
            return TestContainer();
          }
      ),
    );
  }
}





//--------test

Widget TestContainer() {
  return Padding(
    padding: new EdgeInsets.all(10.0),
    child: Container(
      height: 325.0,
      width: 50.0,
      decoration: new BoxDecoration(
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.grey,
            offset: new Offset(0.0, 6.0),
            blurRadius: 10.0,
          )
        ],
        color: Colors.white,
        borderRadius: new BorderRadius.all(
          new Radius.circular(10.0),
        ),

      ),
      child : new Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[

             new Column(
               children: <Widget>[
                 ProfilePic(),
                 new RichText(
                   text: TextSpan(
                     text:'5 miles',  //TODO:
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 20.0,
                       color: Colors.grey

                     ),
                   ),

                 ),
                 MessageButton(),
               ],
             ),

            new Column(
            children: <Widget>[

            Container(
            height: 45.0,
            width: 225.0,
            margin: const EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 10.0),
            decoration: new BoxDecoration(
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.white,
                  offset: new Offset(0.0, 6.0),
                  blurRadius: 20.0,
                )
              ],
              color: Colors.orangeAccent,
              borderRadius: new BorderRadius.all(
                new Radius.circular(10.0),
              ),

            ),

              //TODO : make the value dynamic

              child: SportsType("Golf"),
          ),

              skillDisplay(),
              skillDisplay(),
              skillDisplay(),
              skillDisplay(),



            ],

          ),

        ],


      ),

    ),
  );
}

//TODO: Make Skill Level and sports name dynamic
//---display skills ---
Widget skillDisplay() {
  return new Container(
    height: 45.0,
    width: 225.0,
    margin: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 10.0),
    decoration: new BoxDecoration(
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.white,
          offset: new Offset(0.0, 6.0),
          blurRadius: 20.0,
        )
      ],
      color: Colors.orangeAccent,
      borderRadius: new BorderRadius.all(
        new Radius.circular(10.0),
      ),
      
    ),
    child: SportsType("Tennis"),
  );
}

//TODO: Make label dynamic

Widget SportsType(String label){
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new RichText(
          text: TextSpan(
            text:'${label}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,

            ),
          ),

        ),
  new Container(
       margin: const EdgeInsets.fromLTRB(20.0, 4.0, 3.0, 3.0),
       height: 15.0,
       width: 15.0,
       color: Colors.red,
  ),
        SkillBlockActive(),
        SkillBlockActive(),
        SkillBlockNotActive(),
        SkillBlockNotActive(),
      ],
    ),
  );

}

//Skill block active

Widget SkillBlockActive() {
  return new Container(
    margin: const EdgeInsets.fromLTRB(4.0, 4.0, 3.0, 3.0),
    height: 15.0,
    width: 15.0,
    color: Colors.red,


  );
}

//Skill block not active

Widget SkillBlockNotActive() {
  return new Container(
    margin: const EdgeInsets.fromLTRB(4.0, 4.0, 3.0, 3.0),
    height: 15.0,
    width: 15.0,
    color: Colors.grey,
  );
}

//profilePic
//TODO: change the picture link

Widget ProfilePic() {
  return new  Container(
    height: 120.0,
    width: 120.0,
    margin: const EdgeInsets.fromLTRB(15.0, 15.0, 14.0, 10.0),
    child: new CircleAvatar(
      child: new Container(
        decoration: new BoxDecoration(
            color: const Color(0xffc94b6),
            image: new DecorationImage(
              image: NetworkImage('https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(80.0))
        ),
      ),

    ),
  );
}

//Message Button

Widget MessageButton() {
  return new RawMaterialButton(
    onPressed: () {},
    child: new Icon(
      Icons.message,
      color: Colors.blue,
      size: 35.0,
    ),
    shape: new CircleBorder(),
    elevation: 2.0,
    fillColor: Colors.white,
    padding: const EdgeInsets.all(15.0),
  );

}