import 'package:flutter/material.dart';

class ProviderTest3 extends StatefulWidget {
  const ProviderTest3({Key? key}) : super(key: key);

  @override
  _ProviderTest3State createState() => _ProviderTest3State();
}

class _ProviderTest3State extends State<ProviderTest3> {
  final ValueNotifier<int> _notifier = ValueNotifier(0);
  int _number = 0;

  @override
  void initState() {
    super.initState();
    _notifier.value = _number;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _notifier,
      builder: (_, value, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              _Count(
                count: value,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _number++;
            _notifier.value = _number;
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _Count extends StatelessWidget {
  const _Count({
    Key? key,
    required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    debugPrint("count build");
    return Text(
        //context.watch会导致build重建
        '$count',
        style: Theme.of(context).textTheme.headline4);
  }
}
