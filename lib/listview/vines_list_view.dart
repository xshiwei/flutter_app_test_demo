import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/listview/vines_list_model.dart';
import 'package:provider/provider.dart';

class VinesListProviderView extends StatelessWidget {
  const VinesListProviderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VinesListModel(),
      child: VinesListView<String>(
        data: List.generate(15, (index) => "index"),
        itemWidth: 60,
      ),
    );
  }
}

class VinesListView<T> extends StatefulWidget {
  ///数据
  final List<T> data;

  ///item的宽度
  final double itemWidth;

  const VinesListView({Key? key, required this.data, required this.itemWidth})
      : assert(itemWidth >= 0),
        super(key: key);

  @override
  _VinesListViewState createState() => _VinesListViewState();
}

class _VinesListViewState extends State<VinesListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<VinesListModel>().calculatePosition(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<VinesListModel>()
      .setContext(context, widget.data.length, widget.itemWidth);

    return Consumer<VinesListModel>(
      builder: (context, model, child) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onVerticalDragUpdate: (details) {
          model.updateDyDistance(details.delta.dy);
        },
        child: Stack(
          children: _generateWidgetList(model),
        ),
      ),
    );
  }

  List<Widget> _generateWidgetList(VinesListModel model) {
    final widgetList = <Widget>[];
    if (model.offsetList.isEmpty) {
      widgetList.add(const SizedBox.shrink());
      return widgetList;
    }
    for (int i = 0; i < widget.data.length; i++) {
      var offset = model.offsetList[i];
      var transform = Positioned(
          bottom: offset.dy - model.dyDistance,
          left: offset.dx - widget.itemWidth / 2,
          child: Container(
            color: Colors.red,
            width: widget.itemWidth,
            height: widget.itemWidth,
          ));
      widgetList.add(transform);
    }
    return widgetList;
  }
}
