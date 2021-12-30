import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/router/router.dart';
import 'package:go_router/go_router.dart';

class SynchronousModel {
  SynchronousModel(this.count);

  int count;
}

class SynchronousText extends StatefulWidget {
  const SynchronousText({Key? key}) : super(key: key);

  @override
  State<SynchronousText> createState() => _SynchronousTextState();
}

class _SynchronousTextState extends State<SynchronousText> {
  late SynchronousModel _model;

  @override
  void initState() {
    super.initState();
    _model = SynchronousModel(10);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        context.goNamed(RouterPath.providerItem,
            params: {'name': 'SynchronousText'}, extra: _model);
        setState(() {});
      },
      child: Text("count: ${_model.count}"),
    );
  }
}

class SynchronousStatePage extends StatefulWidget {
  const SynchronousStatePage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SynchronousModel model;

  @override
  _SynchronousStatePageState createState() => _SynchronousStatePageState();
}

class _SynchronousStatePageState extends State<SynchronousStatePage> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          widget.model.count = widget.model.count + 1;
        });
      },
      child: Text("Add ${widget.model.count}"),
    );
  }
}
