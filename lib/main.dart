import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/painter/handle_widget.dart';
import 'package:flutter_app_test_demo/painter/pic_man.dart';

import 'animation/animation_test.dart';
import 'listview/vines_list_view.dart';
import 'provider/provider_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PageList(),
    );
  }
}

class PageList extends StatelessWidget {
  const PageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (_) => const AnimationTest()));
                    },
                    child: const Text("Animation"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (_) => const VinesListProviderView()));
                    },
                    child: const Text("VinesListView"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (_) => const ProviderList()));
                    },
                    child: const Text("Provider"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push<dynamic>(context,
                          MaterialPageRoute<dynamic>(builder: (_) => const PicMan()));
                    },
                    child: const Text("PicMan"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (_) => const HandleWidget()));
                    },
                    child: const Text("HandleWidget"),
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
