import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/animation_test.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'provider_test.dart';
import 'vines_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
          create: (_) => CountModel(),
          child: AnimationTest()),
    );
  }
}
