import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/provider/models/future_model.dart';
import 'package:provider/provider.dart';

class FutureProviderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${Provider.of<FutureBean1>(context).count}"),
            Text("${Provider.of<FutureBean2>(context).count}"),
          ],
        ),
      ),
    );
  }
}

class StreamProviderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("${Provider.of<int>(context)}")),
    );
  }
}
