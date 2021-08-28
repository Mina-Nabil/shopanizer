import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/screens/home/group_list.dart';
import 'package:shopanizer/screens/home/new_group_screen.dart';
import 'package:shopanizer/screens/home/new_list_screen.dart';
import 'package:shopanizer/services/GroupsDBService.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/expandable_floating_button.dart';
import 'package:flutter_svg/svg.dart';

class HomeTab extends StatefulWidget {
  static final screenName = "Home";

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool isAddPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircularButton(child: SvgPicture.asset(Paths.grid, width: 20,), backgroundColor: Colors.transparent, onPressed: null),
                SizedBox(width: 15,),
                CircularButton(child: SvgPicture.asset(Paths.list, width: 20,), backgroundColor: Colors.transparent, onPressed: null),
              ],
            ),
            Divider(thickness: 0.75, color: ShopColors.textFieldBorder,),
            _buildBody()
          ],
        ),
      ),
      floatingActionButton: EaxpandableFAB(
        widget1: SvgPicture.asset(Paths.addGroupIcon),
        backgroundColor1: ShopColors.blueButton,
        onPressed1: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NewGroupScreen())),
        widget2: SvgPicture.asset(Paths.addListIcon),
        backgroundColor2: ShopColors.green,
        onPressed2: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NewListScreen())),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hello Mina",
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
                color: ShopColors.hintColor,
              ),
              hintStyle: TextStyle(
                color: ShopColors.hintColor,
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: "Search"),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Expanded(
        child: StreamProvider<List<Group>>(initialData: [], create: (_) => GroupsDBService().groups, child: GroupsList()));
  }
}
