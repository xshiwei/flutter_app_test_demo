import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/count_model.dart';

class ProviderTest1 extends StatelessWidget {
  const ProviderTest1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("home build");
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Count(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<CountModel>().incrementCounter(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("count build");
    return Text(
        //context.watch会导致build重建
        '${context.watch<CountModel>().count}',
        style: Theme.of(context).textTheme.headline4);
  }
}


