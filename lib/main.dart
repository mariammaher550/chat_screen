// ignore: import_of_legacy_library_into_null_safe
//import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:chat_screen/us.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_screen/services/auth.dart';
import 'package:chat_screen/register.dart';
import 'package:chat_screen/wrapper.dart';
/// @todo wrapper widget
/// @todo toggle view
/// @todo clloud messaging firebase
/// @todo group messaging firebase
/// @todo logout
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Us>.value(value: user, child: MaterialApp(
      home: Wrapper(),
    ));
  }
}