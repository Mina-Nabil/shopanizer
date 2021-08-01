import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
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
          )
        ],
      ),
    );
  }
}
