
import 'package:flutter/material.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/shop_image_placeholder.dart';

class ShopHorizontalImagesList extends StatelessWidget {
  const ShopHorizontalImagesList({
    Key? key,
    required double height,
    required this.item,
  }) : _height = height, super(key: key);

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
            children: item!.images
                .map((e) => Container(
                 margin: EdgeInsets.all(2.0), //must match ShopImagePlaceholder
                  child: Image.network(
                        e,
                        fit: BoxFit.fitWidth,
                        loadingBuilder: (context, child, progress) {
                          return (progress != null)
                              ? Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  ShopImagePlaceholder(height: _height, width: MediaQuery.of(context).size.width / 3),
                                  Container(
                                      width: MediaQuery.of(context).size.width / 3,
                                      height: _height,
                                      alignment: Alignment.bottomCenter,
                                      child: LinearProgressIndicator(
                                        backgroundColor: ShopColors.primary.withAlpha((255*0.3).toInt()),
                                        color: ShopColors.primary,
                                        value: (progress.cumulativeBytesLoaded / progress.expectedTotalBytes!.toDouble()),
                                      ),
                                    ),
                                ],
                              )
                              : child;
                        },
                      ),
                ))
                .toList()),
      ),
    );
  }
}