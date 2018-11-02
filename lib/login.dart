import 'package:flutter/material.dart';
import 'package:givdo_app/definitions.dart';

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
    // TODO: implement initState
    super.initState();
    _scroll = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 8.0),
        child: ListView(controller: _scroll, children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 50.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCustomExpanded(1),
                _displayLogoLoginPage(),
                _buildCustomExpanded(1),
                _displayAppTitleLoginPage(),
                _buildCustomExpanded(3),
                _displayButtonLoginPage(
                    'w Facebook', facebook_blue, _signUpFacebook),
                _buildCustomExpanded(5),
//            _displayButtonLoginPage('Email', givdo_orange),
//            _buildCustomExpanded(1),
//            _displayButtonLoginPage('Password', givdo_orange),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(color: givdo_orange, fontSize: 17.0),
                          initialValue: '',
                          scrollPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          autocorrect: false,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                    color: givdo_orange,
                                  )),
                              fillColor: givdo_orange,
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  color: givdo_orange, fontSize: 17.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                    width: 20.0,
                                    color: givdo_orange,
                                  ))),
                          validator: (str) =>
                              !str.contains('@') ? 'Not a valid Email!' : null,
                          onSaved: (str) => _userEmail = str,
                        ),
                        Container(
                          height: 10.0,
                        ),
                        TextFormField(
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
                              labelStyle: TextStyle(
                                  color: givdo_orange, fontSize: 17.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                    color: givdo_orange,
                                  ))),
                          validator: (str) => str.length <= 7
                              ? 'Password must be at least 7 characters'
                              : null,
                          onSaved: (str) => _userPassword = str,
                          obscureText: true,
                        ),
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
                      style: TextStyle(color: givdo_orange),
                    ),
                    Text('terms',
                        style: TextStyle(
                            color: givdo_orange, fontWeight: FontWeight.w800)),
                  ],
                ),
                _buildCustomExpanded(1),
                _displayButtonLoginPage('SIGN UP', givdo_orange, _signUpGivdo),
                _buildCustomExpanded(1),
                Text(
                  'I have an account',
                  style: TextStyle(
                      color: givdo_orange, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          )
        ]),
      )),
    );
  }

  Container _displayLogoLoginPage() {
    return Container(
        height: 70.0,
        width: 70.0,
        child: Image.asset('images/g-orange-icon_1024px-01.png'));
  }

  Text _displayAppTitleLoginPage() {
    return Text(
      'SIGN UP',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w900,
        color: givdo_orange,
      ),
    );
  }

  ConstrainedBox _displayButtonLoginPage(
      String textButton, Color colorButton, Function functionButton) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: RaisedButton(
          color: colorButton,
          elevation: 1.0,
          onPressed: functionButton,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Text(
              textButton,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
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
