import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
List<String> emails= List();
void add_data(String email)  {
  emails.add(email);
  return;
}
bool email_exists(String email){
  print("HERE");
  print('LENGTH IS '+ emails.length.toString());
  return emails.contains(email);
}