import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/provider/cart/screens/catalog.dart';
import 'package:flutter_app_test_demo/provider/provider_test3.dart';
import 'package:flutter_app_test_demo/provider/synchronous_state_test.dart';


import 'provider_test1.dart';
import 'provider_test2.dart';
import 'stream_test.dart';
import '../config/provider_config.dart';
import 'future_provider_test.dart';
import 'provider_proxy_test.dart';

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
                    onPressed: (){
                      Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
                        builder: (_) => ProviderConfig.instance.getCountModel(child: const ProviderTest1()),
                      ));
                    },
                    child: const Text("Provider Test1"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
                        builder: (_) => ProviderConfig.instance.getCountModel(child: const ProviderTest2()),
                      ));
                    },
                    child: const Text("Provider Test2"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
                        builder: (_) => ProviderConfig.instance.getCountModel(child: const ProviderTest3()),
                      ));
                    },
                    child: const Text("Provider Test3"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
                        builder: (_) => const StreamTest(),
                      ));
                    },
                    child: const Text("Stream Test"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
                        builder: (_) => ProviderConfig.instance.getProviderProxy(child: const ProviderProxyTest()),
                      ));
                    },
                    child: const Text("Provider Proxy Test"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
                        builder: (_) => ProviderConfig.instance.getChangeNotifierProviderProxy(child: const ChangeNotifierProxyTest()),
                      ));
                    },
                    child: const Text("ChangeNotifier Proxy Test"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
                        builder: (_) => ProviderConfig.instance.getFutureProvider(child: const FutureProviderTest()),
                      ));
                    },
                    child: const Text("Future Provider Test"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
                        builder: (_) => ProviderConfig.instance.getStreamProvider(child: const StreamProviderTest()),
                      ));
                    },
                    child: const Text("Stream Provider Test"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
                        builder: (_) => ProviderConfig.instance.getCatalogModel(child: const MyCatalog()),
                      ));
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

