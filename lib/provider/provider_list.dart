import 'package:flutter/material.dart';


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

///ChangeNotifierProxyProvider适合依赖更新Change
