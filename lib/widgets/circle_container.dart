import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/themes/app_theme.dart';

class CircleContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Color backgroundColor;
  final String imageUrl;

  CircleContainer({
    this.width,
    this.height,
    this.color,
    this.imageUrl,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color),
        color: backgroundColor == null ? null : backgroundColor,
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
        ),
      ),
    );
  }
}
