import 'package:chat_screen/dialogueScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../us.dart';

Future<String> registerWithEmailAndPassword(String email,
    String password, context) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password);
    return '';
  } catch (error) {
    return error.code.toString();
  }
}
Future<String> loginWithEmailAndPassword(String email,
    String password, context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => Dialogue()));
    return '';
  } catch (error) {
    return error.code.toString();
  }

}
Future signOut() async {
  try {
    return await FirebaseAuth.instance.signOut();
  }
  catch (e) {
    print(e.toString());
    return null;
  }
}

Us _userFromFirebaseUser(User user) {
  return user != null ? Us(uid: user.uid) : null;
}
Stream<Us> get user {
  return FirebaseAuth.instance.authStateChanges().map(_userFromFirebaseUser);
}