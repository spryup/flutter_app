import 'package:flutter/material.dart';



class InboxPage extends StatelessWidget {

final List<String> messages = ["hi","hello","hey there","hi alice"];
final title = "messages";
//final List<String> imageUrls = ['https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg','https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Messages"),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: new CircleAvatar(
              backgroundImage: new NetworkImage('https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
            ),
            title: Text('${messages[index]}'),
          );

        },
      ),
    );
  }
}

