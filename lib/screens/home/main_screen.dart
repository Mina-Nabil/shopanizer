import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/screens/home/home_tab.dart';
import 'package:shopanizer/screens/home/tab_nav.dart';
import 'package:shopanizer/screens/items/item_screen.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  //screen dimensions
  static const double navBarTopMargin = 2.0;
  static const double navBarIconSize = 20.0;
  static const double navBarHighlightCircleRadius = 5.0;

  int _selectedIndex = 0;
  late String _currentPage = HomeTab.screenName;
  final List<String> pageKeys = [HomeTab.screenName, "Notifications", ItemScreen.screenName];
  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    HomeTab.screenName: GlobalKey<NavigatorState>(),
    "Notifications": GlobalKey<NavigatorState>(),
    ItemScreen.screenName: GlobalKey<NavigatorState>(),
  };

  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: WillPopScope(
            onWillPop: () async {
              final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
              if (isFirstRouteInCurrentTab) {
                if (_currentPage != HomeTab.screenName) {
                  _selectTab(0);
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
                  _buildOffStageWidget(HomeTab.screenName),
                  _buildOffStageWidget("Notifications"),
                  _buildOffStageWidget(ItemScreen.screenName),
                ],
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    color: ShopColors.tabBarBG, border: Border(top: BorderSide(width: 0.25, color: ShopColors.tabBarBorder))),
                child: TabBar(
                  indicatorColor: Colors.transparent,
                  controller: _tabController,
                  onTap: _selectTab,
                  tabs: [
                    Tab(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: navBarTopMargin),
                            child: SvgPicture.asset(
                              Paths.homePageNavBarIcon,
                              color: _selectedIndex == 0 ? ShopColors.primary : ShopColors.unSelectedTab,
                              width: navBarIconSize,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: _selectedIndex == 0 ? ShopColors.blueButton : Colors.transparent, shape: BoxShape.circle),
                            width: navBarHighlightCircleRadius,
                            height: navBarHighlightCircleRadius,
                          )
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: navBarTopMargin),
                              child: SvgPicture.asset(
                                Paths.notificationPageNavBarIcon,
                                color: _selectedIndex == 1 ? ShopColors.primary : ShopColors.unSelectedTab,
                                width: navBarIconSize,
                              )),
                          Container(
                            decoration: BoxDecoration(
                                color: _selectedIndex == 1 ? ShopColors.blueButton : Colors.transparent, shape: BoxShape.circle),
                            width: navBarHighlightCircleRadius,
                            height: navBarHighlightCircleRadius,
                          )
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: navBarTopMargin),
                              child: SvgPicture.asset(
                                Paths.profilePageNavBarIcon,
                                color: _selectedIndex == 2 ? ShopColors.primary : ShopColors.unSelectedTab,
                                width: navBarIconSize,
                              )),
                          Container(
                            decoration: BoxDecoration(
                                color: _selectedIndex == 2 ? ShopColors.blueButton : Colors.transparent, shape: BoxShape.circle),
                            width: navBarHighlightCircleRadius,
                            height: navBarHighlightCircleRadius,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  void _selectTab(int index) {
    String tabItem = pageKeys[index];
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
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem] ?? GlobalKey<NavigatorState>(),
        tabItem: tabItem,
      ),
    );
  }
}
