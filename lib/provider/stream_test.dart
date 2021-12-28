import 'package:flutter/material.dart';

import '../mixin/stream_mixin.dart';

class StreamTest extends StatefulWidget {
  const StreamTest({Key? key}) : super(key: key);

  @override
  _StreamTestState createState() => _StreamTestState();
}

class _StreamTestState extends State<StreamTest> with StreamMixin {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder<dynamic>(
            initialData: 0,
            stream: controller.stream,
            builder: (_, snap) => Text(
                "${snap.data}"
            ),
          ),
          ElevatedButton(
            onPressed: _onAddCount,
            child: const Text("add"),
          )
        ],
      ),
    );
  }

  void _onAddCount(){
    controller.add(++_count);
  }
}