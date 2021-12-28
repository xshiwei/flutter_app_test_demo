import 'package:flutter/cupertino.dart';
import 'package:flutter_app_test_demo/provider/cart/models/cart.dart';
import 'package:flutter_app_test_demo/provider/cart/models/catalog.dart';
import 'package:flutter_app_test_demo/provider/models/future_model.dart';
import 'package:flutter_app_test_demo/provider/models/proxy_model.dart';
import 'package:provider/provider.dart';

import '../provider/models/count_model.dart';

class ProviderConfig {
  factory ProviderConfig() => _getInstance();

  static ProviderConfig get instance => _getInstance();

  static ProviderConfig? _instance;

  static ProviderConfig _getInstance() {
    if (_instance == null) {
      _instance = ProviderConfig._internal();
    }
    return _instance!;
  }

  ProviderConfig._internal();

  Widget getCountModel({required Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountModel()),
      ],
      child: child,
    );
  }

  Widget getProviderProxy({required Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountModel()),
        //使用这个方式，可以重新构建ProxyData，并且可以直接使用Provider.of<ProxyData)(lister: false)拿到这个对象,
        //当CountModel重建会调用update方法
        ProxyProvider<CountModel, ProxyData>(update: (_, count, __) => ProxyData(count.count)),
      ],
      child: child,
    );
  }

  Widget getChangeNotifierProviderProxy({required Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountModel()),
        //proxyModel依赖于CountModel中的内容。
        ChangeNotifierProxyProvider<CountModel, ProxyModel?>(
          create: (_) => ProxyModel(),
          update: (_, count, proxyModel) => proxyModel?..updateCountModel(count),
        ),
      ],
      child: child,
    );
  }

  Widget getFutureProvider({required Widget child}) {
    return MultiProvider(
      providers: [
        //主要用于异步执行任务，并且可以直接通过Provider.of<int>(context)找到
        FutureProvider<FutureBean1>(
          create: (_) => FutureProviderModel().testFuture(),
          initialData: FutureBean1(0),
        ),
        FutureProvider<FutureBean2>(
          create: (_) => FutureProviderModel().testFuture2(),
          initialData: FutureBean2(0),
        )
      ],
      child: child,
    );
  }

  Widget getStreamProvider({required Widget child}) {
    return MultiProvider(
      providers: [
        //主要用于异步执行任务流，并且可以直接通过Provider.of<int>(context)找到
        StreamProvider<int>(
          create: (_) => StreamProviderModel().testStream(),
          initialData: 0,
        )
      ],
      child: child,
    );
  }

  Widget getCatalogModel({required Widget child}) {
    return MultiProvider(
      providers: [
        Provider<CatalogModel>(create: (_) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel?>(
          create: (context) => CartModel(),
          update: (_, catalog, cart) => cart?..catalog = catalog
        )
      ],
      child: child,
    );
  }
}
