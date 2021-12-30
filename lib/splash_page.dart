import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/router/router.dart';
import 'package:supercharged/supercharged.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Future.delayed(2.seconds, () {
        context.goNamed(RouterPath.home);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          '启动页',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
