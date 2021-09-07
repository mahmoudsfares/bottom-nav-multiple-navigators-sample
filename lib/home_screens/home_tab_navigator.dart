import 'package:flutter/material.dart';
import 'home.dart';
import 'home1.dart';
import 'home2.dart';

class HomeTabRoutes {
  static const String root = '/';
  static const String one = '/home1';
  static const String two = '/home2';
}

class HomeTabNavigator extends StatelessWidget {

  HomeTabNavigator({required this.navigatorKey});
  final GlobalKey<NavigatorState>? navigatorKey;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      HomeTabRoutes.root: (context) => Home(),
      HomeTabRoutes.one: (context) => Home1(),
      HomeTabRoutes.two: (context) => Home2(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: HomeTabRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}
