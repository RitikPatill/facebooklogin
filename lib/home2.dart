//import 'package:facebooklogin/home.dart';
//import 'package:phone_auth_project/login.dart';

import 'home.dart';
import 'package:flutter/material.dart';


class Home2 extends StatelessWidget {
 // const Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 100,
                width: 150,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  onPressed: () {
                    print("pressed i am a barber");
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage())
                    );
                  },
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Text(
                    "I am a barber",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                width: 150,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  onPressed: () {
                    print("hello");
                  },
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Text(
                    "I am a user",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
