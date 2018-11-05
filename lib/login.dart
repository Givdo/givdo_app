import 'package:flutter/material.dart';
import 'package:givdo_app/definitions.dart';
import 'package:givdo_app/logingivdobutton.dart';

import 'package:givdo_app/logingivdologo.dart';
import 'package:givdo_app/logingivdotextform.dart';
import 'package:givdo_app/logingivdotitle.dart';

import 'globals.dart' as globals;

class GivdoLoginPage extends StatefulWidget {
  @override
  _GivdoLoginPageState createState() => _GivdoLoginPageState();
}

class _GivdoLoginPageState extends State<GivdoLoginPage> {
  final _formKey = GlobalKey<FormState>();
  ScrollController _scroll;

  _GivdoLoginPageState() {
    globals.givDoUser = new globals
        .GivDoUser(); // Instantiate the givdoUser instance (global) of the GivdoUSer class
  }

  void _signUpGivdo() {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
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
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                        activeColor: givdo_orange,
                        value: globals.termsAndConditionsAccepted,
                        onChanged: (bool value) {
                          setState(() {
                            globals.termsAndConditionsAccepted =
                                !globals.termsAndConditionsAccepted;
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
}

Expanded _buildCustomExpanded(int flexSize) {
  return Expanded(
    flex: flexSize,
    child: Container(),
  );
}
