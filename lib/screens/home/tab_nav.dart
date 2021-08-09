import 'package:flutter/material.dart';
import 'package:shopanizer/screens/home/home_tab.dart';
import 'package:shopanizer/screens/items/add_item.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    late Widget child;
    if (tabItem == HomeTab.screenName)
      child = SafeArea(child: HomeTab());
    else if (tabItem == "Notifications")
      child = SafeArea(
          child: Center(
        child: Container(
          child: Text("Notifications"),
        ),
      ));
    else if (tabItem == AddNewItemScreen.screenName) child = SafeArea(child: AddNewItemScreen());

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
