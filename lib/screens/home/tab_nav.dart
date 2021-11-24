import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/models/list_model.dart';
import 'package:shopanizer/screens/home/group_screen.dart';
import 'package:shopanizer/screens/home/home_tab.dart';
import 'package:shopanizer/screens/home/list_screen.dart';
import 'package:shopanizer/screens/home/new_group_screen.dart';
import 'package:shopanizer/screens/home/new_list_screen.dart';
import 'package:shopanizer/screens/home/settings_tab.dart';
import 'package:shopanizer/services/GroupsDBService.dart';

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

    if (tabItem == HomeTab.screenName){
      child = SafeArea(child: HomeTab());
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<GroupsProvider>(create: (_)  => GroupsProvider(),),
        ],
        child: SafeArea(
          child: Navigator(
            key: navigatorKey,
            initialRoute: '/',
            onGenerateRoute: (routeSettings) {
              String name = routeSettings.name?? "empty route";
              switch (routeSettings.name) {
                case '/':
                  return MaterialPageRoute(builder: (_) => HomeTab());
                case '/newGroup':
                  return MaterialPageRoute(builder: (_) => NewGroupScreen());
                case '/newList':
                  return MaterialPageRoute(builder: (_) => NewListScreen());
                case '/group':
                  return MaterialPageRoute(builder: (_) => GroupScreen(routeSettings.arguments as ShopGroup));
                case '/list':
                  return MaterialPageRoute(builder: (_) => ListScreen(routeSettings.arguments as ShopList));
                default:
                  print("Route not found: " + name);
              }
            },
          ),
        ),
      );
    }
      
    else if (tabItem == "Notifications")
      child = SafeArea(
          child: Center(
        child: Container(
          child: Text("Notifications"),
        ),
      ));
    else if (tabItem == SettingsTab.screenName)
      child = SafeArea(child: SettingsTab());

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
