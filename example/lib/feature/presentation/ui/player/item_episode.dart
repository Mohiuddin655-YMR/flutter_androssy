import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../index.dart';

class ItemEpisode extends StatelessWidget {
  final Video data;

  const ItemEpisode({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return LinearLayout(
      marginBottom: 8,
      orientation: Axis.horizontal,
      children: [
        ImageView(
          width: 120,
          height: 80,
          background: Colors.grey.withOpacity(0.5),
          borderRadius: 12,
          image: data.thumbnail,
          scaleType: BoxFit.cover,
        ),
        LinearLayout(
          flex: 1,
          marginStart: 12,
          children: [
            TextView(
              text: data.name,
              textColor: Colors.white,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
              textSize: 16,
              textFontWeight: FontWeight.w600,
            ),
            TextView(
              marginTop: 4,
              text: "16m 42s",
              textColor: Colors.white.t50,
              textSize: 12,
              textFontWeight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }
}

class ItemEpisodePlaceholder extends StatelessWidget {
  const ItemEpisodePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.t50,
      highlightColor: Colors.grey.t25,
      child: LinearLayout(
        marginBottom: 8,
        orientation: Axis.horizontal,
        children: [
          YMRView(
            width: 120,
            height: 80,
            background: Colors.grey.withOpacity(0.5),
            borderRadius: 12,
          ),
          LinearLayout(
            children: [
              YMRView(
                marginHorizontal: 12,
                background: Colors.grey.withOpacity(0.5),
                height: 24,
                width: 150,
              ),
              YMRView(
                marginTop: 8,
                marginHorizontal: 12,
                background: Colors.grey.withOpacity(0.25),
                height: 18,
                width: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
