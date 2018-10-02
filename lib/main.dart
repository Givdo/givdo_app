import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Givdo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Givdo App'),
        ),
        body: Center(
          child: Text('Todo: Build me'),
        ),
      ),
    );
  }
}
