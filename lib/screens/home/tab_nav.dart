import 'package:flutter/material.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/screens/home/home_tab.dart';
import 'package:shopanizer/screens/items/item_screen.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {

  final ShoppingItem item = ShoppingItem(name: "Talga LG", categoryID: "1", brand: ["Ikea"], fbs: ["www.fb.com/ikea", "www.fb.com/ikeaaa", "ww.fb.com"], desc: "Testing Shopping Item", price: [40.0], instas: ["www.inta.com", "www.insta.git"]);

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
    else if (tabItem == ItemScreen.screenName) child = SafeArea(child: ItemScreen("VJLooiV43woewB9il70o"));

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
