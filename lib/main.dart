import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_navigation/profile_screens/profile_tab_navigator.dart';
import 'home_screens/home_tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}

enum TabItem { home, profile }

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  var _currentTab = TabItem.home;

  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // maybePop() returns true if there is screens to pop and there's no need to handle pop request by system navigation
        // returns false if pop request will be handled by system navigation which will usually close the app
        final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab, go to it
          if (_currentTab != TabItem.home) {
            _selectTab(TabItem.home);
            return false;
          }
        }
        // let system handle back button if we're on the first route (close the app)
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.home),
          _buildOffstageNavigator(TabItem.profile),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Profile',
            ),
          ],
          currentIndex: _currentTab.index,
          onTap: (index) => _selectTab(TabItem.values[index]),
        ),
      ),
    );
  }

  /// creates a tab navigator that will be visually hidden if the tab is not currently selected
  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      // offstage is true when it is not the current tab, false if else
        offstage: _currentTab != tabItem,
        child: _getNavigator(tabItem)
    );
  }

  Widget _getNavigator(TabItem tabItem){
    if(tabItem == TabItem.home) {
      return HomeTabNavigator(navigatorKey: _navigatorKeys[TabItem.home]);
    } else
      return ProfileTabNavigator(navigatorKey: _navigatorKeys[TabItem.profile]);
  }

  /// if the clicked tab is a re-click (current tab), pop to first screen of the current tab's route
  /// else, go to the clicked one
  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }
}

