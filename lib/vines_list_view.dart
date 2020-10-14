import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/vines_list_model.dart';
import 'package:provider/provider.dart';

class VinesListProviderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VinesListModel(),
      child: VinesListView<String>(
        data: ["ssss"],
        itemWidth: 80,
      ),
    );
  }
}

class VinesListView<T> extends StatefulWidget {
  ///数据
  final List<T> data;

  ///item的宽度
  final double itemWidth;

  const VinesListView({Key key, @required this.data, this.itemWidth})
      : assert(data != null),
        assert(itemWidth >= 0),
        super(key: key);

  @override
  _VinesListViewState createState() => _VinesListViewState();
}

class _VinesListViewState extends State<VinesListView> {
  @override
  Widget build(BuildContext context) {
    context.watch<VinesListModel>()
      ..set(widget.data)
      ..setContext(context)
      ..calculateList(widget.itemWidth);
    return Container(
      color: Colors.red,
    );
  }
}
