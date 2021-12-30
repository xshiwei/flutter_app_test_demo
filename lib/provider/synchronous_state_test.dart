import 'package:flutter/material.dart';

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
        await Navigator.push<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
                builder: (_) => _SynchronousStatePage(
                      model: _model,
                    )));
        setState(() {});
      },
      child: Text("count: ${_model.count}"),
    );
  }
}

class _SynchronousStatePage extends StatefulWidget {
  const _SynchronousStatePage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SynchronousModel model;

  @override
  _SynchronousStatePageState createState() => _SynchronousStatePageState();
}

class _SynchronousStatePageState extends State<_SynchronousStatePage> {
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
