import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/provider/models/count_model.dart';
import 'package:flutter_app_test_demo/provider/models/proxy_model.dart';
import 'package:provider/provider.dart';

class ProviderProxyTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              onPressed: () {
                Provider.of<CountModel>(context, listen: false).incrementCounter();
              },
              child: Text('add count'),
            ),
            _Title(),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<ProxyData>().title}');
  }
}

class ChangeNotifierProxyTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              onPressed: () {
                Provider.of<CountModel>(context, listen: false).incrementCounter();
              },
              child: Text('add count'),
            ),
            _Title2(),
          ],
        ),
      ),
    );
  }
}

class _Title2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<ProxyModel>().title}');
  }
}
