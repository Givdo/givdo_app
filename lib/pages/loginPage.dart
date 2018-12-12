import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:givdo_app/pages/homePage.dart';

import 'package:givdo_app/UI/definitions.dart';
import 'package:givdo_app/UI/logingivdobutton.dart';
import 'package:givdo_app/UI/logingivdologo.dart';
import 'package:givdo_app/UI/logingivdotextform.dart';
import 'package:givdo_app/UI/logingivdotitle.dart';

import '../utils/globals.dart' as globals;

class GivdoLoginPage extends StatefulWidget {
  @override
  _GivdoLoginPageState createState() => _GivdoLoginPageState();
}

class _GivdoLoginPageState extends State<GivdoLoginPage> {
  final _formKey = GlobalKey<FormState>();
  ScrollController _scroll;
  bool isLoggedIn = false;
  _GivdoLoginPageState() {
    globals.givDoUser = new globals
        .GivDoUser(); // Instantiate the givdoUser instance (global) of the GivdoUSer class
  }

  void _signInGivdo() {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
    } else
      print('Provided credentials are not valid');
  }

  void _initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult = await facebookLogin.logInWithReadPermissions(['email']);
    print(facebookLoginResult.status);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        var respdata = await postData({'access_token':facebookLoginResult.accessToken.token});
        if(respdata.containsKey('token')) {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('token',respdata['token']);
          print( prefs.getString('token'));
          new HomePage();
          //          Navigator.of(context).pop();
//          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new HomePage()));
        };
        break;
    }
  }

  static Future<Map> postData(Map d) async {
    http.Response res = await http.post('http://192.168.0.136:3000/auth/facebook/callback',body: d); // post api call
    Map data = json.decode(res.body);
    return data;
  }


  @override
  void initState() {
    super.initState();
    _scroll = new ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    return Scaffold(
      return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(controller: _scroll, children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height >
                    MediaQuery.of(context).size.width
                    ? MediaQuery.of(context).size.height - 20.0
                    : MediaQuery.of(context).size.width - 20.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildCustomExpanded(2),
                    DisplayGivdoLogo(logoSize: 70.0),
                    _buildCustomExpanded(1),
                    DisplayGivdoTitle(
                      title: 'SIGN IN',
                    ),
                    _buildCustomExpanded(3),
                    LoginGivdoButton(
                      textButton: 'w Facebook',
                      colorButton: facebook_blue,
                      functionButton: _initiateFacebookLogin,
                    ),
                    _buildCustomExpanded(3),
                    Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            LoginGivdoTextForm(
                              labelTextForm: 'Email',
                              passwordTextForm: false,
                            ),
                            Container(
                              height: 10.0,
                            ),
                            LoginGivdoTextForm(
                              labelTextForm: 'Password',
                              passwordTextForm: true,
                            ),
                          ],
                        )
                    ),
                    FlatButton(
                        textColor: givdo_orange,
                        splashColor: givdo_orange,
                        highlightColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {}, //TODO: forget password page
                        child: Text('Forgot password',
                            style: TextStyle(
                                color: givdo_orange, fontWeight: FontWeight.w800))
                    ),
                    _buildCustomExpanded(1),
                    LoginGivdoButton(
                      textButton: 'SIGN IN',
                      colorButton: givdo_orange,
                      functionButton: _signInGivdo,
                    ),
                    FlatButton(
                        textColor: givdo_orange,
                        splashColor: givdo_orange,
                        highlightColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {}, //TODO: Push Sign UP Page
                        child: Text('Create an account',
                            style: TextStyle(
                                color: givdo_orange, fontWeight: FontWeight.w800)))
                  ],
                ),
              )
            ]),
          )
      );
//    );
  }
}

Expanded _buildCustomExpanded(int flexSize) {
  return Expanded(
    flex: flexSize,
    child: Container(),
  );
}
