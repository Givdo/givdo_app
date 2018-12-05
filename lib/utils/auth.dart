import 'dart:async';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:givdo_app/pages/homePage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _password;
  String _email;
  bool isLoggedIn = false;
  final emailController = TextEditingController();
  final passController = TextEditingController();

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  void _initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult = await facebookLogin.logInWithReadPermissions(['email']);
    print(facebookLoginResult.accessToken.token);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        onLoginStatusChanged(true);
        var respdata = await postData({'access_token':facebookLoginResult.accessToken.token});
        if(respdata.containsKey('token')) {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('token',respdata['token']);
          print( prefs.getString('token'));
          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new HomePage()));
        };
        break;
    }
  }

  static Future<Map> postData(Map d) async {
    http.Response res = await http.post('http://192.168.1.115:3000/auth/facebook/callback',body: d); // post api call
    Map data = json.decode(res.body);
    return data;
  }

  void _submit() {
    print(emailController.text);
    print(passController.text);
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 32.0,
        child: Image.asset("assets/logos/g-orange-icon.png"),
      ),
    );

    final signinLabel = FlatButton(padding: EdgeInsets.symmetric(horizontal: 0.0),
      child: Text(
        'SIGN IN',
        style: TextStyle(color: Color.fromRGBO(255, 153, 51, 1.0),fontFamily:'Catamaran',fontWeight: FontWeight.bold,fontSize: 20.0),
      ),
      onPressed: () {},
    );

    final fbLoginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        child: new InkWell(
          onTap: () => _initiateFacebookLogin(),
          child: new Container(
            //width: 100.0,
            height: 50.0,
            decoration: new BoxDecoration(
              color: Color.fromRGBO(59, 89, 152, 1.0),
//              border: new Border.all(color: Colors.white, width: 2.0),
              borderRadius: new BorderRadius.circular(50.0),
            ),
            child: new Center(child: new Text('w Facebook', style: new TextStyle(fontSize: 18.0, color: Colors.white),),),
          ),
        ),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      autofocus: false,
      style: TextStyle(color: Color.fromRGBO(255, 153, 51, 1.0)),
//      validator: (val) => !val.contains('@')? 'invalid email': null,
//      onSaved: (val) => _email = val,
      decoration: InputDecoration(
        hintStyle: TextStyle(
            color: Color.fromRGBO(255, 153, 51, 1.0)
        ),
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),borderSide: BorderSide(color: Color.fromRGBO(255, 153, 51, 1.0)),),
      ),
    );


    final password = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: passController,
      style: TextStyle(color: Color.fromRGBO(255, 153, 51, 1.0)),
      obscureText: true,
      validator: (val) => val.length > 0? 'password missing': null,
      onSaved: (val) => _password = val,
      decoration:InputDecoration(
        hintStyle: TextStyle(
            color: Color.fromRGBO(255, 153, 51, 1.0)
        ),
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius:BorderRadius.circular(32.0),
          borderSide:new BorderSide(color: Color.fromRGBO(255, 153, 51, 1.0)),
        ),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        child: new InkWell(
          child: new Container(
            //width: 100.0,
            height: 50.0,
            decoration: new BoxDecoration(
              color: Color.fromRGBO(255, 153, 51, 1.0),
              borderRadius: new BorderRadius.circular(50.0),
            ),
            child: new Center(
                child: new Text('SIGN IN', style: new TextStyle(fontSize: 16.0, color: Colors.white))
            ),
          ),
          onTap: () => _submit(),
//              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new HomePage())) ,
        ),
      ),
    );


    final forgotLabel = new InkWell(
      child: Text(
        'Forgot password',
        style: TextStyle(color: Color.fromRGBO(255, 153, 51, 1.0),fontWeight: FontWeight.bold),
      ),
      onTap: () {},
    );

    final createAccountLabel = new InkWell(
      child: Center(
        child: Text(
          'Create Account',
          style: TextStyle(color: Color.fromRGBO(255, 153, 51, 1.0),fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {},
    );

//    return new Scaffold(
    return new Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Form(
        child: ListView(
          children: <Widget>[
            logo,
            signinLabel,
            fbLoginButton,
            SizedBox(height: 24.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 8.0),
            forgotLabel,
//            SizedBox(height: 8.0),
            loginButton,
            createAccountLabel,
          ],
        ),
      ),
    );
//    );
  }
}
