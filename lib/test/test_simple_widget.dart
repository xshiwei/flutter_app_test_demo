import 'package:flutter/material.dart';

class TestSimpleWidget extends StatelessWidget {
  final String title;
  final String message;

  const TestSimpleWidget({Key key, this.title, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Test Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
