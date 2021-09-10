import 'package:flutter/material.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/shared/widgets/shopanizer_image.dart';

class ShopHorizontalImagesList extends StatelessWidget {
  static const double _imageWidth = 120;

  const ShopHorizontalImagesList({
    Key? key,
    required double height,
    required this.item,
  })  : _height = height,
        super(key: key);

  final double _height;
  final ShoppingItem? item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: _height,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: item!.images.map((e) => ShopanizerImage(url: e, height: _height, imageWidth: _imageWidth)).toList()),
      ),
    );
  }
}

