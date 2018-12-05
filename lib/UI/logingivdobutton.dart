import 'package:flutter/material.dart';

class LoginGivdoButton extends StatelessWidget {
  final String textButton;
  final Color colorButton;
  final Function functionButton;

  LoginGivdoButton({this.textButton, this.colorButton, this.functionButton});

  @override
  Widget build(BuildContext context) {
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
