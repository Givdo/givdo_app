import 'package:flutter/material.dart';
import 'definitions.dart';
import '../utils/globals.dart' as globals;

class LoginGivdoTextForm extends StatelessWidget {
  final String labelTextForm;
  final bool passwordTextForm;

  LoginGivdoTextForm({
    this.labelTextForm,
    this.passwordTextForm,
  });

  @override
  Widget build(BuildContext context) {
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
          labelText: labelTextForm,
          labelStyle: TextStyle(color: givdo_orange, fontSize: 17.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                width: 20.0,
                color: givdo_orange,
              ))),
      validator: (str) => passwordTextForm
          ? globals.verifyUserPassword(str)
          : globals.verifyUserEmail(str),
      onSaved: (str) => passwordTextForm
          ? globals.givDoUser.givDoUserPassword = str
          : globals.givDoUser.givDoUserEmail = str,
      obscureText: passwordTextForm,
    );
  }
}
