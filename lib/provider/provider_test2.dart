import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/count_model.dart';

class ProviderTest2 extends StatelessWidget {
  const ProviderTest2({Key? key}) : super(key: key);

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
              builder: (_, count, child) => Text("count--> $count"),
              selector: (_, model) => model.count,
            ),
            Consumer<CountModel>(
              builder: (_, model, child) => Text("count--> ${model.count}"),
            ),
            const AddButton(),
            const ReduceButton(),
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("AddButton build");
    var model = Provider.of<CountModel>(context, listen: false);

    return Column(
      children: [
        ElevatedButton(
          onPressed: model.incrementCounter,
          child: Selector<CountModel, int>(
            builder: (_, count, child) => Text("add --> $count"),
            selector: (_, model) => model.count,
          ),
        ),
      ],
    );
  }
}

class ReduceButton extends StatelessWidget {
  const ReduceButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("ReduceButton build");
    var model = Provider.of<CountModel>(context, listen: false);

    //context.select 会导致build重建，和watch唯一不同的是它可以只监听某个值
    return ElevatedButton(
      onPressed: model.reduceCounter,
      child: Text("reduce --> ${context.select<CountModel, int>((value) => value.count)}"),
    );
  }
}
