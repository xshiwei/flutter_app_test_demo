import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/provider/models/future_model.dart';
import 'package:provider/provider.dart';

class FutureProviderTest extends StatelessWidget {
  const FutureProviderTest({Key? key}) : super(key: key);

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
  const StreamProviderTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("${Provider.of<int>(context)}")),
    );
  }
}
