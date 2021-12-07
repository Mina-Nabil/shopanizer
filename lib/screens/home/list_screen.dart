import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/models/list_model.dart';
import 'package:shopanizer/screens/home/new_list_screen.dart';
import 'package:shopanizer/screens/home/tiles_list.dart';
import 'package:shopanizer/screens/items/add_item.dart';
import 'package:shopanizer/services/DatabaseService.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/expandable_floating_button.dart';
import 'package:shopanizer/shared/widgets/photo_viewer.dart';
import 'package:shopanizer/shared/widgets/search_field.dart';

enum ShopCollection {
  USER,
  GROUP,
  LIST
}
class ListScreen extends StatefulWidget {
  ListScreen(this.currentList);
  ShopList currentList;

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  List<ShopList> lists = [];
  List<ShopItem> items = [];
 @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      //maybe from cache
      List<ShopList> fetchedLists = await DatabaseHelper.getListsById(widget.currentList.lists);
      List<ShopItem> fetchedItems = await DatabaseHelper.getItemsById(widget.currentList.items);
      setState(() {
        lists = fetchedLists;
        items = fetchedItems;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: ShopEdgeInsects.scaffoldPadding),
        child: Column(
          children: [
            Row(
              children: [
                PhotoViewer.circular(
                  image: Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/ba-0111778-lr-1592404733.jpg",fit: BoxFit.cover,),
                  radius: 30.0,
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleTV3(text: widget.currentList.name,),
                    LabelTV2(text: "group name",),
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            SearchField(),
            SizedBox(height: 10,),
            Divider(thickness: 0.75, color: ShopColors.textFieldBorder,),

            Expanded(
              child: TilesList([], lists, items)
            )
          ],
        ),
      ),
      floatingActionButton: EaxpandableFAB(
        widget1: SvgPicture.asset(Paths.addListIcon),
        backgroundColor1: ShopColors.lightGreenButton,
        onPressed1: () async {
          ShopList? newList = await Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => NewListScreen(parentId: widget.currentList.id, parentType: ShopCollection.LIST,)
          ));
          if(newList != null) {
            setState(() {
              widget.currentList.lists.add(newList.id);
              lists.add(newList);
            });
            Navigator.pushNamed(context, '/list', arguments: newList);
          } else {
            print("Normal back from add new item");
          }
        },
        widget2: SvgPicture.asset(Paths.addItemIcon),
        backgroundColor2: ShopColors.greenButton,
        onPressed2: () async {
          // will return the new item ID only if new item is created
          ShopItem? addedItem = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddNewItemScreen(parentId: widget.currentList.id)));
          if(addedItem != null) {
            print("addedItemID ${addedItem.id}");
            setState(() {
              widget.currentList.items.add(addedItem.id);
              items.add(addedItem);
            });
          }
          else
            print("Normal back from add new item");
        },
      ),
    );
  }

//     Future<void> refresh() async {
// print("refresh");
//       // re-fetch the current list and its children
//       //maybe in future try to eliminate multiple refreshes if time differenece is small ~1 sec

//       // Don't do re-assign to currentobject, as this will change this local object while the original one in previous screen will not change
//       // --Bad-- ShopList fetchedList = await DatabaseHelper.getListById(widget.currentList.id);
//       List<ShopList> fetchedChildrenLists = await DatabaseHelper.getListsById(widget.currentList.lists);
//       List<ShopItem> fetchedChildrenItems = await DatabaseHelper.getItemsById(widget.currentList.items);

//       setState(() {
//         //print("setstate: ${widget.currentList.hashCode} ${widget.currentList.items}");
//         lists = fetchedChildrenLists;
//         items = fetchedChildrenItems;
//       });
//   }
}