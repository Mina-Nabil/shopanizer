import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';

class EmptyHomeWidget extends StatelessWidget {
  const EmptyHomeWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
            child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    child: SvgPicture.asset(Paths.emptyHomeIcon)),
                Text("You have no groups or lists yet!"),
                Text(
                  "Organize your shopping and start now",
                  style: TextStyle(color: ShopColors.primary, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ));
  }
}