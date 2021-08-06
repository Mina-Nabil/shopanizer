import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/expandable_floating_button.dart';
import 'package:flutter_svg/svg.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool isAddPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildHeader(), _buildBody()],
        ),
      ),
      floatingActionButton: EaxpandableFAB(
        addGroupAction: () => print("add group"),
        addListAction: () => print("add list"),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hello Mostafa",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            )),
        Text(
          "My Shopanizer",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          style: TextStyle(),
          decoration: InputDecoration(
              isDense: true,
              prefixIcon: Icon(
                Icons.search,
                color: ShopColors.placeHolderColor,
              ),
              hintStyle: TextStyle(
                color: ShopColors.placeHolderColor,
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: "Search"),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Expanded(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                child: SvgPicture.asset('assets/images/empty_home.svg')),
                Text("You have no groups or lists yet!"),
                Text("Organize your shoping and start now", style: TextStyle(color: ShopColors.primary, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ));
  }
}
