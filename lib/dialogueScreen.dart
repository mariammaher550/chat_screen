import 'package:chat_screen/message_widget.dart';
import 'package:chat_screen/services/auth.dart';
import 'package:chat_screen/services/firebase_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'messages_widget.dart';





class Dialogue extends StatefulWidget{
  @override
  _DialogueState createState() => _DialogueState();
}

class _DialogueState extends State<Dialogue>{
  int order = 0;
  void sendMessage() async {
    FocusScope.of(context).unfocus();

    await FirebaseApi.uploadMessage(FirebaseAuth.instance.currentUser.uid, message);
    message = '';
      _controller.clear();
  }
  var _controller = TextEditingController();
  String message = '';
  bool flag = false;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true,
      body: SafeArea(
      child: Column(
          children: [
          AppBar(
          title: Text("Group Chat"),
          actions: <Widget>[
            FlatButton.icon(
              icon : Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async{
                await signOut();
              },
            )
          ],

        )
                     ,
      Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Messages(),
        ),
      ),
          //  MessageWidget(message: message, isMe: true),
            Row(
              children: <Widget> [
                Expanded(
                  child: TextField(

                    controller: _controller,
                    textCapitalization: TextCapitalization.sentences,
                    autocorrect: true,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      labelText: 'Type your message',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 0),
                        gapPadding: 10,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onChanged: (value) => setState(() {
                      message = value;
                    }
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                    onTap: message.trim().isEmpty ? null : sendMessage,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:  Colors.blue,
                      ),
                      child: Icon(Icons.send, color: Colors.white),
                    )
                )
              ],
            ),
      ],
          ),

         )
    );


  //);
  }

}

