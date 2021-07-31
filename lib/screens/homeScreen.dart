import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/Themes/shopanizer_theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text("Home")),
          Center(child: Text("Notification")),
          Center(child: Text("User")),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: ShopColors.tabBarBG,
            border:
                Border(top: BorderSide(width: 0.25, color:ShopColors.tabBarBorder))),
        child: TabBar(
          controller: _tabController,
          onTap: onTap,
          tabs: [
            Tab(
              icon: SvgPicture.asset('assets/icons/tab_bar/home.svg',
                  color: _tabController.index == 0
                      ? ShopColors.primary
                      : ShopColors.unSelectedTab),
            ),
            Tab(
              icon: SvgPicture.asset('assets/icons/tab_bar/notifications.svg',
                  color: _tabController.index == 1
                      ? ShopColors.primary
                      : ShopColors.unSelectedTab),
            ),
            Tab(
              icon: Icon(
                Icons.person,
                color: _tabController.index == 2
                    ? ShopColors.primary
                    : ShopColors.unSelectedTab,
              ),
            ),
          ],
          indicatorColor: Colors.transparent,
        ),
      ),
    );
  }

  onTap(index) {
    if (_tabController.previousIndex != _tabController.index) {
      setState(() {});
    }
  }
}
