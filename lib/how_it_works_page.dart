import 'package:flutter/material.dart';
import 'package:givdo_app/definitions.dart';
import 'package:givdo_app/logingivdobutton.dart';
import 'package:givdo_app/logingivdologo.dart';

class HowItWorksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Column howItWorksStep(
        Widget icon, String instructions, TextStyle instructionsStyle) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          icon,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 55.0),
            child: Text(
              instructions,
              style: instructionsStyle,
              textAlign: TextAlign.center,
            ),
          )
        ],
      );
    }

    Container howItWorksStepNumberIcon(String number, Color color) {
      return Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Text(
            number,
            style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
                color: givdo_white),
          ));
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            howItWorksStep(
                DisplayGivdoLogo(logoSize: 55.0),
                "HOW IT WORKS",
                TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                  color: color,
                )),
            Container(
              height: 30.0,
            ),
            howItWorksStep(
                howItWorksStepNumberIcon("1", color),
                "Challenge a friend to a game of trivia or random play",
                TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  color: color,
                )),
            howItWorksStep(
                howItWorksStepNumberIcon("2", color),
                "Win GivCoins!",
                TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  color: color,
                )),
            howItWorksStep(
                howItWorksStepNumberIcon("3", color),
                "Donate to a cause of your choosing.",
                TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  color: color,
                )),
            Container(
              height: 190.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: LoginGivdoButton(
                textButton: 'PLAY',
                colorButton: givdo_purple,
                functionButton: _beginPlay,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _beginPlay() {}
}
