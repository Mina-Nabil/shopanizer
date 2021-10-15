import 'package:flutter/material.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:flutter_svg/svg.dart';

class RoundedCornerButton extends StatelessWidget {
  static const double radius = 20;

  final Widget child;
  final VoidCallback? onPressed;
  final Color backgroundColor;

  RoundedCornerButton({
    required this.child,
    required this.backgroundColor,
    required this.onPressed,
  });

  RoundedCornerButton.text(
      {required String text,
      required this.backgroundColor,
      required this.onPressed})
      : this.child = Text(text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        primary: backgroundColor,
        shadowColor: Colors.transparent,
      ),
    );
  }
}

class DoneButton extends StatelessWidget {
  final VoidCallback onPressed;
  DoneButton({required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RoundedCornerButton(
      child: Row(
        children: [
          SvgPicture.asset(
            Paths.checkIcon,
            color: Colors.white,
          ),
          SizedBox(
            width: 3.0,
          ),
          Text(
            "Done",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      backgroundColor: ShopColors.greenButton,
      onPressed: onPressed,
    );
  }
}

class EditButton extends StatelessWidget {
  final VoidCallback onPressed;
  EditButton({required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RoundedCornerButton.text(
        text: "Edit",
        backgroundColor: ShopColors.blueButton,
        onPressed: onPressed);
  }
}

class CircularButton extends StatelessWidget {
  CircularButton({
    @required this.child,
    this.radius = 12,
    @required this.backgroundColor,
    @required this.onPressed,
  });
  final Widget? child;
  final double radius;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: radius * 2,
        width: radius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: this.backgroundColor,
        ),
        child: FittedBox(
            child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: child,
        )),
      ),
      onTap: onPressed,
    );
  }
}
