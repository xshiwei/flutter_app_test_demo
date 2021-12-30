import 'package:flutter/foundation.dart';
import 'package:flutter_app_test_demo/animation/animation_test.dart';
import 'package:flutter_app_test_demo/config/provider_config.dart';
import 'package:flutter_app_test_demo/home_page.dart';
import 'package:flutter_app_test_demo/listview/vines_list_view.dart';
import 'package:flutter_app_test_demo/painter/handle_widget.dart';
import 'package:flutter_app_test_demo/painter/pic_man.dart';
import 'package:flutter_app_test_demo/provider/cart/screens/catalog.dart';
import 'package:flutter_app_test_demo/provider/future_provider_test.dart';
import 'package:flutter_app_test_demo/provider/provider_list.dart';
import 'package:flutter_app_test_demo/provider/provider_proxy_test.dart';
import 'package:flutter_app_test_demo/provider/provider_test1.dart';
import 'package:flutter_app_test_demo/provider/provider_test2.dart';
import 'package:flutter_app_test_demo/provider/provider_test3.dart';
import 'package:flutter_app_test_demo/provider/stream_test.dart';
import 'package:flutter_app_test_demo/provider/synchronous_state_test.dart';
import 'package:flutter_app_test_demo/splash_page.dart';
import 'package:go_router/go_router.dart';

class RouterPath {
  static const String initPath = 'splash';
  static const String home = 'home';
  static const String animation = 'animation';
  static const String vinesListView = 'vinesListView';
  static const String providerList = 'providerList';
  static const String providerItem = 'providerItem';
  static const String picMan = 'picMan';
  static const String handleWidget = 'handleWidget';
}

/// goName 会改变路径，也会清空该路径，返回的时候根据子路径进行返回
/// pushName 会新Push一个到当前Stack上，不改变当前路径。当返回的时候先返回当前的页面

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  urlPathStrategy: UrlPathStrategy.path,
  routes: [
    GoRoute(
      name: RouterPath.initPath,
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      name: RouterPath.home,
      path: '/home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          name: RouterPath.animation,
          path: 'animation',
          builder: (context, state) => const AnimationTest(),
        ),
        GoRoute(
          name: RouterPath.vinesListView,
          path: 'vinesListView',
          builder: (context, state) => const VinesListProviderView(),
        ),
        GoRoute(
          name: RouterPath.providerList,
          path: 'providerList',
          builder: (context, state) => const ProviderList(),
          routes: [
            GoRoute(
                name: RouterPath.providerItem,
                path: 'providerItem/:name',
                builder: (context, state) {
                  final name = state.params['name']!;
                  switch (name) {
                    case 'Provider Test1':
                      return ProviderConfig.instance
                          .getCountModel(child: const ProviderTest1());
                    case 'Provider Test2':
                      return ProviderConfig.instance
                          .getCountModel(child: const ProviderTest2());
                    case 'Provider Test3':
                      return ProviderConfig.instance
                          .getCountModel(child: const ProviderTest3());
                    case 'Stream Test':
                      return const StreamTest();
                    case 'Provider Proxy Test':
                      return ProviderConfig.instance
                          .getProviderProxy(child: const ProviderProxyTest());
                    case 'ChangeNotifier Proxy Test':
                      return ProviderConfig.instance
                          .getChangeNotifierProviderProxy(
                              child: const ChangeNotifierProxyTest());
                    case 'Future Provider Test':
                      return ProviderConfig.instance
                          .getFutureProvider(child: const FutureProviderTest());
                    case 'Stream Provider Test':
                      return ProviderConfig.instance
                          .getStreamProvider(child: const StreamProviderTest());
                    case 'MyCatalog':
                      return ProviderConfig.instance
                          .getCatalogModel(child: const MyCatalog());
                    case 'SynchronousText':
                      final model = state.extra as SynchronousModel;
                      return SynchronousStatePage(
                        model: model,
                      );
                  }
                  return throw Exception('Not Page Found');
                }),
          ],
        ),
        GoRoute(
          name: RouterPath.picMan,
          path: 'picMan',
          builder: (context, state) => const PicMan(),
        ),
        GoRoute(
          name: RouterPath.handleWidget,
          path: 'handleWidget',
          builder: (context, state) => const HandleWidget(),
        )
      ],
    ),
  ],
);
