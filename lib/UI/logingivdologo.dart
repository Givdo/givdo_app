import 'package:flutter/material.dart';

class DisplayGivdoLogo extends StatelessWidget {
  final double logoSize;

  DisplayGivdoLogo({
    this.logoSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: logoSize,
        width: logoSize,
        child: Image.asset("assets/logos/g-orange-icon.png"));
  }
}
