import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../index.dart';

class ItemVideo extends StatelessWidget {
  final Video data;

  const ItemVideo({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    double dimensionSize = 120;
    return ImageView(
      width: dimensionSize,
      height: dimensionSize.xi(50),
      image: data.thumbnail,
      scaleType: BoxFit.cover,
      background: Colors.grey.t50,
      borderRadius: dimensionSize.x(10),
    );
  }
}

class ItemVideoPlaceholder extends StatelessWidget {
  const ItemVideoPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    double dimensionSize = 120;
    return Shimmer.fromColors(
      baseColor: Colors.grey.t50,
      highlightColor: Colors.grey.t25,
      child: YMRView(
        width: dimensionSize,
        height: dimensionSize.xi(50),
        background: Colors.grey.t50,
        borderRadius: dimensionSize.x(10),
      ),
    );
  }
}
