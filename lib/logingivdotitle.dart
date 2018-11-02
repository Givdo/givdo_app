import 'package:flutter/material.dart';
import 'package:givdo_app/definitions.dart';

class DisplayGivdoTitle extends StatelessWidget {
  final String title;

  DisplayGivdoTitle({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w900,
        color: givdo_orange,
      ),
    );
  }
}
