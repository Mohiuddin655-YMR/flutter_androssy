import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../index.dart';

class ItemRelative extends StatelessWidget {
  final Video video;

  const ItemRelative({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    double dimensionSize = 120;
    return ImageView(
      width: dimensionSize.xi(65),
      height: dimensionSize,
      image: video.thumbnail,
      scaleType: BoxFit.cover,
      background: Colors.grey.t50,
      borderRadius: dimensionSize.x(10),
    );
  }
}

class ItemRelativePlaceholder extends StatelessWidget {
  const ItemRelativePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    double dimensionSize = 120;
    return Shimmer.fromColors(
      baseColor: Colors.grey.t50,
      highlightColor: Colors.grey.t25,
      child: YMRView(
        width: dimensionSize.xi(65),
        height: dimensionSize,
        background: Colors.grey.t50,
        borderRadius: dimensionSize.x(10),
      ),
    );
  }
}
