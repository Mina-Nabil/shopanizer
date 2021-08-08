import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/screens/home/home_tab.dart';
import 'package:shopanizer/screens/items/add_item.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: Colors.white,
      tabBuilder: (context, index) {
        return CupertinoTabView(builder: (BuildContext context) {
          switch (index) {
            case 0:
              return SafeArea(child: CupertinoPageScaffold(child: HomeTab()));

            case 1:
              return SafeArea(child: CupertinoPageScaffold(child: Center(child: Text("Notification"))));

            case 2:
              return SafeArea(child: CupertinoPageScaffold(child: AddNewItemScreen()));

            default:
              return SafeArea(child: CupertinoPageScaffold(child: HomeTab()));
          }
        });
      },
      tabBar: CupertinoTabBar(
        backgroundColor: ShopColors.tabBarBG,
        border: Border(top: BorderSide(width: 0.25, color: ShopColors.tabBarBorder)),
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Paths.homePageNavBarIcon,
                color: _currentIndex == 0 ? ShopColors.primary : ShopColors.unSelectedTab),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Paths.notificationPageNavBarIcon,
                color: _currentIndex == 1 ? ShopColors.primary : ShopColors.unSelectedTab),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _currentIndex == 2 ? ShopColors.primary : ShopColors.unSelectedTab,
            ),
          ),
        ],
      ),
    );
  }

  onTap(index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
