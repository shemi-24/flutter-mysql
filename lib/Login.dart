import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mysql/profile.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool visible=false;
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  Future UserLogin() async{
    String email=emailController.text;
    String password=passwordController.text;
    var url='http://192.168.18.4/login_user.php';
    var data={'email':email,'password':password};
    var response=await http.post(url,body: json.encode(data));

    var message=jsonDecode(response.body);
    if(message=="Login Matched"){
      setState(() {
        visible=false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen(email: emailController.text,)));
    }
    else{
      setState(() {
        visible=false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(80),
            child: Center(
              child: Column(
                children: <Widget>[

                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('User Login Form',
                          style: TextStyle(fontSize: 21))),

                  Divider(),

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: emailController,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Enter Your Email Here'),
                      )
                  ),

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: passwordController,
                        autocorrect: true,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Enter Your Password Here'),
                      )
                  ),

                  RaisedButton(
                    onPressed: UserLogin,
                    color: Colors.green,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                    child: Text('Click Here To Login'),
                  ),

                  Visibility(
                      visible: visible,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: CircularProgressIndicator()
                      )
                  ),

                ],
              ),
            )));
  }
  }

