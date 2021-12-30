import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/provider/synchronous_state_test.dart';
import 'package:flutter_app_test_demo/router/router.dart';
import 'package:go_router/go_router.dart';

class ProviderList extends StatelessWidget {
  const ProviderList({Key? key}) : super(key: key);

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
                      context.goNamed(RouterPath.providerItem,
                          params: {'name': 'Provider Test1'});
                    },
                    child: const Text("Provider Test1"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(RouterPath.providerItem,
                          params: {'name': 'Provider Test2'});
                    },
                    child: const Text("Provider Test2"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(RouterPath.providerItem,
                          params: {'name': 'Provider Test3'});
                    },
                    child: const Text("Provider Test3"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(RouterPath.providerItem,
                          params: {'name': 'Stream Test'});
                    },
                    child: const Text("Stream Test"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(RouterPath.providerItem,
                          params: {'name': 'Provider Proxy Test'});
                    },
                    child: const Text("Provider Proxy Test"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(RouterPath.providerItem,
                          params: {'name': 'ChangeNotifier Proxy Test'});
                    },
                    child: const Text("ChangeNotifier Proxy Test"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(RouterPath.providerItem,
                          params: {'name': 'Future Provider Test'});
                    },
                    child: const Text("Future Provider Test"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(RouterPath.providerItem,
                          params: {'name': 'Stream Provider Test'});
                    },
                    child: const Text("Stream Provider Test"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(RouterPath.providerItem,
                          params: {'name': 'MyCatalog'});
                    },
                    child: const Text("MyCatalog"),
                  ),
                  const SynchronousText(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

///Provider(create: (context) => model()),这个适合不是Changes的model类，提供以便在子类可以查找到。
///这样的方式还有ProxyProvider,FutureProvider,StreamProvider。
///不是只有changes才可以使用Providers，理论上任何类都可以使用。

///ChangeNotifierProxyProvider适合依赖更新Changes,R为model。

///代理适合依赖关系，例如购物车依赖于商品List数据。工作依赖于人，当人更新后，工作也应当被更新。

///changes 应该只管理数据，类似的控件点击事件在控件内部实现。

///ChangeNotifierProvider.value 可以复用changes，给另一个页面复用changes
