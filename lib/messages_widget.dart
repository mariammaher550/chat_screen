import 'package:chat_screen/services/firebase_api.dart';
import 'package:chat_screen/message_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_screen/message_widget.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages>{
  bool isMe = false;
  String userEmail = '';
  final Stream<QuerySnapshot> _docsStream = FirebaseFirestore.instance.collection('groupChat').orderBy("CreatedAt", descending: false).snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _docsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(), widthFactor: 0.01, heightFactor: 0.01,);
        }

        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
               isMe = (data['userId'] == FirebaseAuth.instance.currentUser.uid);
               isMe ? userEmail = '' : userEmail = data['Email'] + ':\n';
            return
                MessageWidget(message: data['Message'], isMe: isMe, userEmail: userEmail, );
          }).toList(),
        );
      },
    );
  }
}









































// class MessagesWidget extends StatelessWidget {
//   final String idUser;
//
//   const MessagesWidget({
//     @required this.idUser,
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => StreamBuilder<List<Map<String,String>>>(
//     stream: FirebaseApi.getMessages(idUser),
//     builder: (context, snapshot) {
//       switch (snapshot.connectionState) {
//         case ConnectionState.waiting:
//           return Center(child: CircularProgressIndicator());
//         default:
//           if (snapshot.hasError) {
//             return buildText('Something Went Wrong Try later');
//           } else {
//             final messages = snapshot.data;
//
//             return messages.isEmpty
//                 ? buildText('Say Hi..')
//                 : ListView.builder(
//               physics: BouncingScrollPhysics(),
//               reverse: true,
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 final message = messages[index];
//
//                 return MessageWidget(
//                   message: message,
//                   isMe: message.idUser == myId,
//                 );
//               },
//             );
//           }
//       }
//     },
//   );
//
//   Widget buildText(String text) => Center(
//     child: Text(
//       text,
//       style: TextStyle(fontSize: 24),
//     ),
//   );
// }