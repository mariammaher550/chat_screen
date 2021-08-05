import 'package:chat_screen/us.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_screen/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:chat_screen/dialogueScreen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final u = Provider.of<Us>(context);
    print(u);
    return u == null  ? Authenticate() : Dialogue();
  }
}
