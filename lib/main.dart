import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/painter/handle_widget.dart';
import 'package:flutter_app_test_demo/painter/pic_man.dart';

import 'animation/animation_test.dart';
import 'listview/vines_list_view.dart';
import 'provider/provider_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PageList(),
    );
  }
}

class PageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => AnimationTest()));
                    },
                    child: Text("Animation"),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => VinesListProviderView()));
                    },
                    child: Text("VinesListView"),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ProviderList()));
                    },
                    child: Text("Provider"),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => PicMan()));
                    },
                    child: Text("PicMan"),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => HandleWidget()));
                    },
                    child: Text("HandleWidget"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

