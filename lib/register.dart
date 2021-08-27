
import 'package:chat_screen/services/add_data.dart';
import 'package:flutter/material.dart';
import 'package:chat_screen/services/auth.dart';
import 'package:chat_screen/authenticate.dart';
class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register Page'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Login'),
              onPressed: (){
                widget.toggleView();
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                        helperText: 'EMAIL'
                    ),
                    validator: (val) {
                      if (!val.contains('@') || val.isEmpty) return 'Invalid Email Format';
                      else if(email_exists(val)) return 'Email already in use';
                      else return null;
                    },
                    onChanged: (val){
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        helperText: 'PASSWORD'
                    ),
                    validator: (val) => (val.length < 6 || val.contains(' ') || val.isEmpty)  ? 'Invalid Password Format. make sure its length is 6+ and does not contain any empty spaces'  : null, // We can add validation conditions we want here
                    onChanged: (val){
                      setState(() => password = val);
                      //  _auth.setPw= password;
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    child: Text(
                      'SIGN UP',
                    ),
                    onPressed: () async{
                      if(_formKey.currentState.validate()){
                        dynamic result = await registerWithEmailAndPassword(email, password, context);
                        if (result != '') {
                          setState(() {
                            error = result;
                          });
                        }
                      }
                      add_data(email);

                    },
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }


}