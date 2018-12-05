//import 'package:flutter/material.dart';
//import 'package:givdo_app/pages/loginPage.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        theme: ThemeData(fontFamily: 'Sura'),
//        title: 'Givdo',
//      home: LoginPage()
//    );
//  }
//}
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:givdo_app/pages/homePage.dart';
import 'package:givdo_app/pages/loginPage.dart';
import 'package:http/http.dart' as http;
import 'package:givdo_app/UI/logingivdologo.dart';
import 'package:givdo_app/UI/definitions.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future getAuth() async {
  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  if(token != null) {
    print("TOKEN in storage $token");
    final resp = await http.get('http://192.168.1.115:3000/auth/checklogin',headers: {'Authorization': token});
    if(resp.body == 'Unauthorized'){
      print("Not valid token");
      return false;
    } else {
      var userdata = json.decode(resp.body);
      if (userdata.containsKey('id')) {
        return true;
      } else {
        print("Not valid.");
        return false;
      }
    }

  } else {
    print("Did not Find TOKEN in storage");
    return false;
  }
}


void main() => runApp(MyApp(post: getAuth()));

class MyApp extends StatelessWidget {
  final Future post;

  MyApp({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Givdo',
      theme: ThemeData(fontFamily: 'Sura'),
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //redirection will be here
                print("snapshot: ${snapshot.data}");//
                return snapshot.data == false ? new GivdoLoginPage(): new HomePage();
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner
//              return CircularProgressIndicator();
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildCustomExpanded(3),
                    _displayAppTitleMainPage(),
                    _buildCustomExpanded(1),
                    DisplayGivdoLogo(logoSize: 160.0),
                    _buildCustomExpanded(6),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  Expanded _buildCustomExpanded(int flexSize) {
    return Expanded(
      flex: flexSize,
      child: Container(),
    );
  }

  Text _displayAppTitleMainPage() {
    return Text(
      'Givdo',
      style:
      TextStyle(fontSize: 70.0, color: givdo_orange, letterSpacing: -1.0),
    );
  }
}
