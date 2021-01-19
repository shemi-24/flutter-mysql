import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  final String email;

  const ProfileScreen({Key key, this.email}) : super(key: key);

  void logout(BuildContext context){
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            //appBar: AppBar(title: Text('Profile Screen'),
                //automaticallyImplyLeading: false),
          backgroundColor: Colors.cyan,
            body: Center(
                child: Column(children: <Widget>[

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: Text('Email = ' + '\n' + email,
                          style: TextStyle(fontSize: 20))
                  ),

                  RaisedButton(
                    onPressed: () {
                      logout(context);
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text('Click Here To Logout'),
                  ),

                ],)
            )
        )
    );
  }
}
