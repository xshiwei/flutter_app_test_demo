import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/home_page.dart';
import 'package:provider/provider.dart';

class ProviderTest extends StatefulWidget {
  @override
  _ProviderTestState createState() => _ProviderTestState();
}

class _ProviderTestState extends State<ProviderTest> {
  @override
  Widget build(BuildContext context) {
    debugPrint("ProviderTest build");
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Selector<CountModel, int>(
              builder: (_, count, child) => Text("count--> ${count}"),
              selector: (_, model) => model.count,
            ),
            // Consumer<CountModel>(
            //   builder: (_, model, child) => Text("count--> ${model.count}"),
            // ),
            AddButton(),
            ReduceButton(),
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("AddButton build");
    var model = Provider.of<CountModel>(context, listen: false);

    return Column(
      children: [
        RaisedButton(
          onPressed: model.incrementCounter,
          child: Selector<CountModel, int>(
            builder: (_, count, child) => Text("add --> ${count}"),
            selector: (_, model) => model.count,
          ),
        ),
      ],
    );
  }
}

class ReduceButton extends StatefulWidget {
  @override
  _ReduceButtonState createState() => _ReduceButtonState();
}

class _ReduceButtonState extends State<ReduceButton> {
  @override
  Widget build(BuildContext context) {
    debugPrint("ReduceButton build");
    var model = Provider.of<CountModel>(context, listen: false);

    return RaisedButton(
      onPressed: model.reduceCounter,
      child: Text("reduce --> ${context.select<CountModel, int>((value) => value.count)}"),
    );
  }
}
