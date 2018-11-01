import 'package:flutter/material.dart';
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

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

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
            _displayLogoMainPage(),
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
      '$title',
      style:
          TextStyle(fontSize: 70.0, color: givdo_orange, letterSpacing: -1.0),
    );
  }

  Container _displayLogoMainPage() {
    return Container(
        height: 170.0,
        width: 170.0,
        child: Image.asset('images/g-orange-icon_1024px-01.png'));
  }
}
