import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/screens/home/home_tab.dart';
import 'package:shopanizer/screens/home/tab_nav.dart';
import 'package:shopanizer/screens/items/add_item.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';

enum MainTabs { home, notifications, profile }

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late String _currentPage = "Home";
  final List<String> pageKeys = ["Home", "Notifications", "Profile"];
  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Home": GlobalKey<NavigatorState>(),
    "Notifications": GlobalKey<NavigatorState>(),
    "Profile": GlobalKey<NavigatorState>(),
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Home") {
            _selectTab("Home", 1);
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            _buildOffStageWidget("Home"),
            _buildOffStageWidget("Notifications"),
            _buildOffStageWidget("Profile"),
          ],
        ),
        bottomNavigationBar: CupertinoTabBar(
          backgroundColor: ShopColors.tabBarBG,
          border: Border(top: BorderSide(width: 0.25, color: ShopColors.tabBarBorder)),
          onTap: (int index) {
            _selectTab(pageKeys[index], index);
          },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Paths.homePageNavBarIcon,
                  color: _selectedIndex == 0 ? ShopColors.primary : ShopColors.unSelectedTab),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Paths.notificationPageNavBarIcon,
                  color: _selectedIndex == 1 ? ShopColors.primary : ShopColors.unSelectedTab),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 2 ? ShopColors.primary : ShopColors.unSelectedTab,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  Widget _buildOffStageWidget(String tabItem) {
    if (_navigatorKeys[tabItem] != null) {
      return Offstage(
        offstage: _currentPage != tabItem,
        child: TabNavigator(
          navigatorKey: _navigatorKeys[tabItem] ?? GlobalKey<NavigatorState>(),
          tabItem: tabItem,
        ),
      );
    } else {
      print("GEET HNA");
      return Container(
        child: Text("EDA"),
      );
    }
  }
}
