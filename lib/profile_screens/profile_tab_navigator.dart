import 'package:flutter/material.dart';
import 'package:multi_navigation/profile_screens/profile.dart';
import 'package:multi_navigation/profile_screens/profile1.dart';
import 'package:multi_navigation/profile_screens/profile2.dart';


class ProfileTabRoutes {
  static const String root = '/';
  static const String one = '/profile1';
  static const String two = '/profile2';
}

class ProfileTabNavigator extends StatelessWidget {

  final GlobalKey<NavigatorState>? navigatorKey;
  ProfileTabNavigator({required this.navigatorKey});

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      ProfileTabRoutes.root: (context) => Profile(),
      ProfileTabRoutes.one: (context) => Profile1(),
      ProfileTabRoutes.two: (context) => Profile2(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: ProfileTabRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}