import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoggedIn = false;
  Map _userObj = {};
  bool facebookLogin=false;
  bool _isLoggedInn = false;
  late GoogleSignInAccount _userObjj;
  GoogleSignIn _googleSignIn = GoogleSignIn();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Login"),
      ),
      body: Column(
        children: [
          Container(

            child: _isLoggedIn
                ? Column(
                    children: [
                      Image.network(_userObj["picture"]["data"]["url"]),
                      Text(_userObj["name"]),
                      Text(_userObj["email"]),
                      TextButton(
                          onPressed: () {
                            FacebookAuth.instance.logOut().then((value) {
                              setState(() {
                                _isLoggedIn = false;
                                _userObj = {};
                              });
                            });
                          },
                          child: Text("Logout"))
                    ],
                  )
                : Center(
                    child: ElevatedButton(
                      child: Text("Login with Facebook"),
                      onPressed: () async {
                        FacebookAuth.instance.login(
                            permissions: ["public_profile", "email"]).then((value) {
                          FacebookAuth.instance.getUserData().then((userData) {
                            setState(() {
                              _isLoggedIn = true;
                              facebookLogin=true;
                              _userObj = userData;
                            });
                          });
                        });
                      },
                    ),
                  ),
          ),
          Container(
            child: _isLoggedInn
                ? Column(
              children: [
                Image.network(_userObjj.photoUrl.toString()),
                Text(_userObjj.displayName.toString()),
                Text(_userObjj.email),
                TextButton(
                    onPressed: () {
                      _googleSignIn.signOut().then((value) {
                        setState(() {
                          _isLoggedInn = false;
                        });
                      }).catchError((e) {});
                    },
                    child: Text("Logout"))
              ],
            )
                : Center(
              child: ElevatedButton(
                child: Text("Login with Google"),
                onPressed: () {
                  _googleSignIn.signIn().then((userData) {
                    setState(() {
                      _isLoggedInn = true;
                      _userObjj = userData!;
                    });
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
            ),
          ),
        ],
      ),


    );
  }
}
