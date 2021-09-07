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

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: HomeTabRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => MaterialApp(
            routes: {
              HomeTabRoutes.root: (context) => Home(),
              HomeTabRoutes.one: (context) => Home1(),
              HomeTabRoutes.two: (context) => Home2(),
            },
          ),
        );
      },
    );
  }
}
