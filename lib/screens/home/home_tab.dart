import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopanizer/screens/home/list_screen.dart';
import 'package:shopanizer/screens/home/tiles_list.dart';
import 'package:shopanizer/services/GroupsDBService.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/expandable_floating_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/shared/widgets/search_field.dart';

class HomeTab extends StatefulWidget {
  static final screenName = "Home";

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  void initState() {
    super.initState();
    Provider.of<CurrentUser>(context, listen: false).loadGroups();
  }

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
        onPressed1: () => Navigator.pushNamed(context, '/newGroup'),
        widget2: SvgPicture.asset(Paths.addListIcon),
        backgroundColor2: ShopColors.green,
        onPressed2: () => Navigator.pushNamed(context, '/newList', arguments: [FirebaseAuth.instance.currentUser!.uid, ShopCollection.USER]),
      ),
    );
  }

  Widget _buildHeader() {
    String name = Provider.of<CurrentUser>(context, listen: true).name;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hello $name",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            )),
        TitleTV3(text: "My Shopanizer",),
        SizedBox(
          height: 5,
        ),
        SearchField(),
      ],
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Consumer<CurrentUser> (
        builder: (context,provider,_) {
          return TilesList(provider.groups, provider.lists, []);
        },
      ),
    );
  }
}
