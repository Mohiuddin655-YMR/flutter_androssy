import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../index.dart';

class ItemTrailer extends StatelessWidget {
  final Movie item;

  const ItemTrailer({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return StackLayout(
      marginTop: 24,
      children: [
        ImageView(
          scaleType: BoxFit.cover,
          image: item.thumbnail,
          positionType: ViewPositionType.centerFill,
        ),
        LinearLayout(
          background: Colors.black87,
          padding: 16,
          children: [
            StackLayout(
              children: [
                ImageView(
                  width: double.infinity,
                  image: item.thumbnail,
                  dimensionRatio: 1.65,
                  borderRadius: 8,
                  scaleType: BoxFit.cover,
                  foreground: Colors.black.withOpacity(0.5),
                ),
                IconView(
                  icon: Icons.play_arrow_rounded,
                  size: 70,
                  tint: Colors.white,
                  shadowColor: Colors.black.withOpacity(0.5),
                  shadow: 10,
                  shadowBlurRadius: 50,
                ),
              ],
            ),
            TextView(
              text: item.name,
              textColor: Colors.white,
              textSize: 24,
              textFontWeight: FontWeight.bold,
              marginTop: 24,
            ),
            TextView(
              text: "2023 | Mystery, Thriller, Drama",
              textColor: Colors.white54,
              textFontWeight: FontWeight.w500,
              textSize: 16,
              marginTop: 4,
            ),
            TextView(
              text: "Rent",
              textColor: Colors.yellow,
              textSize: 12,
              paddingHorizontal: 24,
              paddingVertical: 4,
              borderColor: Colors.yellow,
              borderRadius: 4,
              borderSize: 1.5,
              marginTop: 16,
            ),
            TextView(
              marginTop: 16,
              text:
                  "Supernaturally gifted fortune teller, Puff Daddy, ascends to stardom after a chance discovery. His powers help Sultan in a crucial election victory, but in return, Sultan loses his mistress. What tragedy await for others.",
              textColor: Colors.white54,
              textSize: 16,
            ),
            LinearLayout(
              marginTop: 16,
              orientation: Axis.horizontal,
              crossGravity: CrossAxisAlignment.center,
              children: [
                TextView(
                  text: "Watch Now",
                  textColor: Colors.white,
                  textSize: 14,
                  textFontWeight: FontWeight.bold,
                  textAllCaps: true,
                  paddingHorizontal: 24,
                  paddingVertical: 12,
                  borderRadius: 8,
                  background: Colors.redAccent,
                ),
                Spacer(),
                TextView(
                  text: "Added",
                  textColor: Colors.white,
                  textSize: 14,
                  textFontWeight: FontWeight.bold,
                  textAllCaps: true,
                  paddingHorizontal: 24,
                  paddingVertical: 12,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ItemTrailerPlaceholder extends StatelessWidget {
  const ItemTrailerPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.t50,
      highlightColor: Colors.grey.t25,
      child: StackLayout(
        marginTop: 24,
        children: [
          YMRView(
            background: Colors.white.withOpacity(0.1),
            positionType: ViewPositionType.centerFill,
          ),
          LinearLayout(
            background: Colors.black12,
            padding: 16,
            children: [
              StackLayout(
                children: [
                  YMRView(
                    width: double.infinity,
                    background: Colors.white.t25,
                    dimensionRatio: 1.65,
                    borderRadius: 8,
                    foreground: Colors.black.withOpacity(0.5),
                  ),
                  IconView(
                    icon: Icons.play_arrow_rounded,
                    size: 70,
                    tint: Colors.white,
                    shadowColor: Colors.white.t25,
                    shadow: 10,
                    shadowBlurRadius: 50,
                  ),
                ],
              ),
              TextView(
                text: "TITLE",
                textColor: Colors.transparent,
                textSize: 24,
                width: 300,
                borderRadius: 4,
                background: Colors.white.t25,
                textFontWeight: FontWeight.bold,
                marginTop: 24,
              ),
              TextView(
                text: "SUBTITLE",
                textColor: Colors.transparent,
                background: Colors.white.t15,
                width: 200,
                borderRadius: 4,
                textFontWeight: FontWeight.w500,
                textSize: 16,
                marginTop: 4,
              ),
              TextView(
                text: "Rent",
                textColor: Colors.white.t15,
                textSize: 12,
                paddingHorizontal: 24,
                paddingVertical: 4,
                borderColor: Colors.white.t15,
                borderRadius: 4,
                borderSize: 1.5,
                marginTop: 16,
              ),
              TextView(
                marginTop: 16,
                text: "DESCRIPTION",
                textColor: Colors.transparent,
                background: Colors.white.t15,
                textSize: 16,
              ),
              LinearLayout(
                marginTop: 16,
                orientation: Axis.horizontal,
                crossGravity: CrossAxisAlignment.center,
                children: [
                  TextView(
                    text: "Watch Now",
                    textColor: Colors.transparent,
                    background: Colors.white.t15,
                    textSize: 14,
                    textFontWeight: FontWeight.bold,
                    textAllCaps: true,
                    paddingHorizontal: 24,
                    paddingVertical: 12,
                    borderRadius: 8,
                  ),
                  const Spacer(),
                  TextView(
                    text: "Added",
                    textColor: Colors.transparent,
                    background: Colors.white.t15,
                    textSize: 14,
                    textFontWeight: FontWeight.bold,
                    textAllCaps: true,
                    paddingHorizontal: 24,
                    paddingVertical: 12,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
