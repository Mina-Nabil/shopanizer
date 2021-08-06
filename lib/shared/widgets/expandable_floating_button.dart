

import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/circular_button.dart';
import 'package:flutter_svg/svg.dart';
class EaxpandableFAB extends StatefulWidget {

  EaxpandableFAB({required this.addGroupAction, required this.addListAction});

  final VoidCallback addGroupAction;
  final VoidCallback addListAction;
  @override
  _EaxpandableFABState createState() => _EaxpandableFABState();
}

class _EaxpandableFABState extends State<EaxpandableFAB> {
  bool isAddPressed = false;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if(isAddPressed)
          CircularButton(
            backgroundColor: ShopColors.green,
            radius: 20,
            child: SvgPicture.asset('assets/icons/list.svg'),
            onPressed: widget.addListAction,
          ),
          if(isAddPressed)
          SizedBox(width: 10,),
          if(isAddPressed)
          CircularButton(
            backgroundColor: ShopColors.blue,
            radius: 20,
            child: SvgPicture.asset('assets/icons/group.svg'),
            onPressed: widget.addGroupAction,
          ),
          if(isAddPressed)
          SizedBox(width: 10,),
          CircularButton(
            backgroundColor: ShopColors.primary,
            radius: 25,
            child: Icon(
              isAddPressed? Icons.close : Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isAddPressed = !isAddPressed;
              });
            },
          )
        ],
      );
  }
}