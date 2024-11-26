import 'package:cached_network_image/cached_network_image.dart';
import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flutter/cupertino.dart';

class CustomImage extends StatefulWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final bool isNotification;
  final String placeholder;
  final String? otherImage;

  const CustomImage({
    super.key,
    required this.image,
    this.otherImage,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.isNotification = false,
    this.placeholder = '',
  });

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fadeInDuration: const Duration(microseconds: 200),
      fadeOutDuration: const Duration(microseconds: 200),
      imageUrl: widget.image,
      cacheKey: widget.image,
      height: widget.height,
      width: widget.width,
      fit: widget.fit,
      placeholder: (context, url) => Image.asset(
        widget.placeholder.isNotEmpty
            ? widget.placeholder
            : ConstantImage.placeHolder,
        height: widget.height,
        width: widget.width,
        fit: widget.fit,
      ),
      errorWidget: (context, url, error) {
        if (widget.otherImage == null || widget.otherImage!.endsWith('.png')) {
          return Image.asset(
            widget.placeholder.isNotEmpty
                ? widget.placeholder
                : ConstantImage.placeHolder,
            height: widget.height,
            width: widget.width,
            fit: widget.fit,
          );
        } else {
          return Image.network(
            widget.otherImage ?? "",
            height: widget.height,
            width: widget.width,
            fit: widget.fit,
          );
        }
      },
    );
  }
}
