import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/circular_button.dart';

class EaxpandableFAB extends StatefulWidget {
  EaxpandableFAB(
      {required this.widget1,
      required this.backgroundColor1,
      required this.onPressed1,
      this.widget2,
      this.backgroundColor2,
      this.onPressed2});

  final Widget widget1;
  final Color backgroundColor1;
  final VoidCallback onPressed1;

  final Widget? widget2;
  final Color? backgroundColor2;
  final VoidCallback? onPressed2;

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
        if (isAddPressed) ..._getExpandedButtons(),
        CircularButton(
          backgroundColor: ShopColors.primary,
          radius: 25,
          child: Icon(
            isAddPressed ? Icons.close : Icons.add,
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

  List<Widget> _getExpandedButtons() {
    List<Widget> buttons = [];

    if (widget.widget2 != null) {
      buttons.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: CircularButton(
            backgroundColor: widget.backgroundColor2,
            radius: 20,
            child: widget.widget2,
            onPressed: widget.onPressed2,
          ),
        ));
    }

    buttons.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: CircularButton(
          backgroundColor: widget.backgroundColor1,
          radius: 20,
          child: widget.widget1,
          onPressed: widget.onPressed1,
        ),
      ));

    return buttons;
  }
}
