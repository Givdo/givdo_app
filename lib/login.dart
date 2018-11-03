import 'package:flutter/material.dart';
import 'package:givdo_app/definitions.dart';
import 'package:givdo_app/logingivdobutton.dart';

import 'package:givdo_app/logingivdologo.dart';
import 'package:givdo_app/logingivdotitle.dart';

class GivdoLoginPage extends StatefulWidget {
  @override
  _GivdoLoginPageState createState() => _GivdoLoginPageState();
}

class _GivdoLoginPageState extends State<GivdoLoginPage> {
  final _formKey = GlobalKey<FormState>();
  ScrollController _scroll;
  bool _termsAndConditions = true;
  String _userEmail;
  String _userPassword;

  void _signUpGivdo() {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      print('Email: $_userEmail');
      print('Password: $_userPassword');
      print('Sign Up Givdo App!');
    } else
      print('Provided credentials are not valid');
  }

  void _signUpFacebook() {
    //TODO:
    print('Sign Up Facebook!');
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
    return Scaffold(
      body: SafeArea(
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
                  title: 'SIGN UP',
                ),
                _buildCustomExpanded(3),
                LoginGivdoButton(
                  textButton: 'w Facebook',
                  colorButton: facebook_blue,
                  functionButton: _signUpFacebook,
                ),
                _buildCustomExpanded(5),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildEmailTextFormField(),
                        Container(
                          height: 10.0,
                        ),
                        _buildPasswordTextFormField(),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                        activeColor: givdo_orange,
                        value: _termsAndConditions,
                        onChanged: (bool value) {
                          setState(() {
                            _termsAndConditions = !_termsAndConditions;
                          });
                        }),
                    Text(
                      'By signing you agree to our ',
                      style: TextStyle(color: givdo_orange, fontSize: 10.0),
                    ),
                    Text('terms',
                        style: TextStyle(
                            color: givdo_orange,
                            fontWeight: FontWeight.w800,
                            fontSize: 10.0)),
                  ],
                ),
                _buildCustomExpanded(1),
                LoginGivdoButton(
                  textButton: 'SIGN UP',
                  colorButton: givdo_orange,
                  functionButton: _signUpGivdo,
                ),
                FlatButton(
                    textColor: givdo_orange,
                    splashColor: givdo_orange,
                    highlightColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {}, //TODO: Push Sign In Page
                    child: Text('I have an account',
                        style: TextStyle(
                            color: givdo_orange, fontWeight: FontWeight.w800)))
              ],
            ),
          )
        ]),
      )),
    );
  }

  TextFormField _buildPasswordTextFormField() {
    return TextFormField(
      style: TextStyle(color: givdo_orange, fontSize: 17.0),
      initialValue: '',
      autocorrect: false,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: givdo_orange,
              )),
          fillColor: givdo_orange,
          labelText: 'Password',
          labelStyle: TextStyle(color: givdo_orange, fontSize: 17.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: givdo_orange,
              ))),
      validator: (str) =>
          str.length <= 7 ? 'Password must be at least 7 characters' : null,
      onSaved: (str) => _userPassword = str,
      obscureText: true,
    );
  }

  TextFormField _buildEmailTextFormField() {
    return TextFormField(
      style: TextStyle(color: givdo_orange, fontSize: 17.0),
      initialValue: '',
      scrollPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      autocorrect: false,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: givdo_orange,
              )),
          fillColor: givdo_orange,
          labelText: 'Email',
          labelStyle: TextStyle(color: givdo_orange, fontSize: 17.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                width: 20.0,
                color: givdo_orange,
              ))),
      validator: (str) => !str.contains('@') ? 'Not a valid Email!' : null,
      onSaved: (str) => _userEmail = str,
    );
  }
}

Expanded _buildCustomExpanded(int flexSize) {
  return Expanded(
    flex: flexSize,
    child: Container(),
  );
}
