import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../index.dart';

class ItemDrama extends StatelessWidget {
  final Movie model;

  const ItemDrama({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double dimensionSize = size.width.x(75) ?? 180;
    return ImageView(
      width: dimensionSize,
      scaleType: BoxFit.cover,
      height: dimensionSize.x(55),
      image: model.thumbnail,
      background: Colors.grey.t50,
      borderRadius: dimensionSize.x(5),
    );
  }
}

class ItemPlaceholderDrama extends StatelessWidget {
  const ItemPlaceholderDrama({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double dimensionSize = size.width.x(75) ?? 180;
    return Shimmer.fromColors(
      baseColor: Colors.grey.t50,
      highlightColor: Colors.grey.t25,
      child: YMRView(
        width: dimensionSize,
        height: dimensionSize.x(55),
        background: Colors.grey.t50,
        borderRadius: dimensionSize.x(5),
      ),
    );
  }
}