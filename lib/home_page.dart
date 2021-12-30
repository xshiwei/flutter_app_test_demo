import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/router/router.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                      context.goNamed(RouterPath.animation);
                    },
                    child: const Text("Animation"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(RouterPath.vinesListView);
                    },
                    child: const Text("VinesListView"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(RouterPath.providerList);
                    },
                    child: const Text("Provider"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(RouterPath.picMan);
                    },
                    child: const Text("PicMan"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(RouterPath.handleWidget);
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
