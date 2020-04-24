import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_messenger/Model/FirebaseHelper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_messenger/Model/User.dart';
import 'package:flutter_messenger/Widgets/CustomImage.dart';
import 'package:flutter_messenger/Controller/ChatController.dart';

class ContactsController extends StatefulWidget {

  String id;

  ContactsController(String id) {
    this.id = id;
  }

  ContactsControllerState createState() => new ContactsControllerState();

}

class ContactsControllerState extends State<ContactsController> {

  @override
  Widget build(BuildContext context) {
   return new FirebaseAnimatedList(
     query: FirebaseHelper().base_user, 
     sort: (a, b) => a.value["prenom"].compareTo(b.value["prenom"]),
     itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
       User newUser = new User(snapshot);
       if (newUser.id == widget.id) {
         // C'est l'utilisateur
         return new Container();
       } else {
         //Les contacts
          return new ListTile(
         leading: new CustomImage(newUser.imageUrl, newUser.initiales, 20.0),
         title: new Text("${newUser.prenom} ${newUser.nom}"),
         trailing: new IconButton(icon: new Icon(Icons.message), onPressed: () {
           //Envoie vers le controller de Chat pour discuter.
           Navigator.push(context, new MaterialPageRoute(builder: (context) => new ChatController(widget.id, newUser)));
         }),
       );
       }
     }
    );
  }
}