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

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: ProfileTabRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => MaterialApp(
            routes: {
              ProfileTabRoutes.root: (context) => Profile(),
              ProfileTabRoutes.one: (context) => Profile1(),
              ProfileTabRoutes.two: (context) => Profile2(),
            },
          ),
        );
      },
    );
  }
}
