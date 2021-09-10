
import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/shop_image_placeholder.dart';

class ShopanizerImage extends StatelessWidget {
  const ShopanizerImage({
    Key? key,
    required String url,
    required double height,
    required double imageWidth,
  })  : _url = url,
        _height = height,
        _imageWidth = imageWidth,
        super(key: key);

  final String _url;
  final double _height;
  final double _imageWidth;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      _url,
      fit: BoxFit.fitWidth,
      cacheWidth: _imageWidth.toInt(),
      cacheHeight: _height.toInt(),
      loadingBuilder: (context, child, progress) {
        return (progress != null)
            ? Container(
                height: _height,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    ShopImagePlaceholder(height: _height, width: _imageWidth),
                    Container(
                      width: _imageWidth - 5,
                      padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.all(2.0), //must match ShopImagePlaceholder
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: LinearProgressIndicator(
                          backgroundColor: ShopColors.primary.withAlpha((255 * 0.3).toInt()),
                          color: ShopColors.primary,
                          value: (progress.cumulativeBytesLoaded / progress.expectedTotalBytes!.toDouble()),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.all(2.0), //must match ShopImagePlaceholder child;
                child: child);
      },
    );
  }
}