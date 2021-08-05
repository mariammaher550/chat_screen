import 'package:chat_screen/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
class FirebaseApi{

  static Future uploadMessage(String userId, String message) async{
    if (message.isEmpty || message == ' ') return;
     CollectionReference ref = FirebaseFirestore.instance.collection("groupChat");
     await ref.add(
       {
         'userId' : FirebaseAuth.instance.currentUser.uid,
         'Message' : message,
         'Email' : FirebaseAuth.instance.currentUser.email,
         'CreatedAt' :DateTime.now(),
       }
     );

  }


}