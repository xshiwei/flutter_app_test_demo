import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/provider/cart/screens/catalog.dart';
import 'package:flutter_app_test_demo/provider/provider_test3.dart';


import 'provider_test1.dart';
import 'provider_test2.dart';
import 'stream_test.dart';
import '../config/provider_config.dart';
import 'future_provider_test.dart';
import 'provider_proxy_test.dart';

class ProviderList extends StatelessWidget {
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
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProviderConfig.instance.getCountModel(child: ProviderTest1()),
                      ));
                    },
                    child: Text("Provider Test1"),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProviderConfig.instance.getCountModel(child: ProviderTest2()),
                      ));
                    },
                    child: Text("Provider Test2"),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProviderConfig.instance.getCountModel(child: ProviderTest3()),
                      ));
                    },
                    child: Text("Provider Test3"),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => StreamTest(),
                      ));
                    },
                    child: Text("Stream Test"),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProviderConfig.instance.getProviderProxy(child: ProviderProxyTest()),
                      ));
                    },
                    child: Text("Provider Proxy Test"),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProviderConfig.instance.getChangeNotifierProviderProxy(child: ChangeNotifierProxyTest()),
                      ));
                    },
                    child: Text("ChangeNotifier Proxy Test"),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProviderConfig.instance.getFutureProvider(child: FutureProviderTest()),
                      ));
                    },
                    child: Text("Future Provider Test"),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProviderConfig.instance.getStreamProvider(child: StreamProviderTest()),
                      ));
                    },
                    child: Text("Stream Provider Test"),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProviderConfig.instance.getCatalogModel(child: MyCatalog()),
                      ));
                    },
                    child: Text("MyCatalog"),
                  ),
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

