import 'dart:async';

import 'package:flutter/material.dart';
import 'package:givdo_app/login.dart';
import 'package:givdo_app/logingivdologo.dart';
import 'definitions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'Givdo';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primaryColor: givdo_primaryColor,
        accentColor: givdo_orange,
        iconTheme: IconThemeData(color: givdo_white),
        fontFamily: 'Catamaran',
      ),
      home: MyHomePage(
        title: appName,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), _goToLoginPage);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _goToLoginPage() {
    Navigator.of(context).pop();
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new GivdoLoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
      '${widget.title}',
      style:
          TextStyle(fontSize: 70.0, color: givdo_orange, letterSpacing: -1.0),
    );
  }
}
