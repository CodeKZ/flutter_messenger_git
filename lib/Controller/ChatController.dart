import 'package:flutter/material.dart';
import 'package:flutter_messenger/Model/User.dart';
import 'package:flutter_messenger/Widgets/CustomImage.dart';
import 'package:flutter_messenger/Widgets/ZoneDeTexteWidget.dart';

class ChatController extends StatefulWidget {

  String id;
  User partenaire;

  ChatController(String id, User partenaire) {
    this.id;
    this.partenaire = partenaire;
  }

  ChatControllerState createState() => new ChatControllerState();

}

class ChatControllerState extends State<ChatController> {

 @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new CustomImage(widget.partenaire.imageUrl, widget.partenaire.initiales, 15.0),
          new Text(widget.partenaire.prenom)
        ],
      ),
     ),
     body: new Container(
      child: new InkWell(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: new Column(
          children: <Widget>[
            new Flexible(child: new Container()),
            new Divider(height: 1.5),
            new ZoneDeTexteWidget(widget.partenaire, widget.id)
          ],
        ),
      ) 
     ),
    );
  }
}