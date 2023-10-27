import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../../../index.dart';

class SubscriptionActivity extends AndrossyActivity {
  final Video data;

  const SubscriptionActivity({
    super.key,
    required this.data,
  });

  @override
  AndrossyController init(BuildContext context) {
    return AndrossyController();
  }

  @override
  Widget? onCreateTitle(BuildContext context) {
    return const ImageView(
      image: LogoContent.logo,
      width: 40,
      shape: ViewShape.squire,
    );
  }

  @override
  AndrossyAppbarConfig appbarConfig(BuildContext context) {
    return super.appbarConfig(context).copyWith(titleCenter: true);
  }

  @override
  Widget onCreate(BuildContext context, AndrossyInstance instance) {
    return LinearLayout(
      scrollable: true,
      children: [
        ImageView(
          dimensionRatio: 1.4,
          background: Colors.grey,
          borderRadius: 24,
          margin: 12,
          image: data.thumbnail,
          scaleType: BoxFit.cover,
        ),
        TitledView(
          titleColor: Colors.white.t50,
          title: "Rent now",
          marginHorizontal: 12,
          clipBehavior: Clip.antiAlias,
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              title: const TextView(
                text: "Rent",
                textColor: Colors.white,
                textSize: 16,
                textFontWeight: FontWeight.w500,
              ),
              subtitle: TextView(
                text: data.name,
                textColor: Colors.white.withOpacity(0.5),
                textSize: 14,
              ),
              tilePadding: const EdgeInsets.only(
                left: 16,
                right: 12,
              ),
              trailing: LinearLayout(
                orientation: Axis.horizontal,
                crossGravity: CrossAxisAlignment.center,
                children: [
                  TextView(
                    text: "BDT 10.0/Month",
                    textColor: Colors.white.t75,
                    textSize: 12,
                    marginEnd: 4,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),
          ),
        ),
        TitledView(
          marginTop: 32,
          titleColor: Colors.white.t50,
          title: "Or enjoy unlimited access to our library",
          marginHorizontal: 12,
          clipBehavior: Clip.antiAlias,
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              title: const TextView(
                text: "365 Days of Unlimited Bongo",
                textColor: Colors.white,
                textSize: 16,
                textFontWeight: FontWeight.w500,
              ),
              tilePadding: const EdgeInsets.only(
                left: 16,
                right: 12,
              ),
              trailing: LinearLayout(
                orientation: Axis.horizontal,
                crossGravity: CrossAxisAlignment.center,
                children: [
                  TextView(
                    text: "BDT 400.0/Year",
                    textColor: Colors.white.t75,
                    textSize: 12,
                    marginEnd: 4,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),
          ),
        ),
        StackLayout(
          marginTop: 8,
          marginHorizontal: 12,
          borderColor: Colors.redAccent,
          children: [
            const YMRView(
              background: Colors.redAccent,
              positionType: ViewPositionType.topFlex,
              height: 24,
              marginHorizontal: 1.5,
              borderRadius: 12,
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white.d80,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                title: const TextView(
                  text: "30 Days of Unlimited Bongo",
                  textColor: Colors.white,
                  textSize: 16,
                  textFontWeight: FontWeight.w500,
                ),
                tilePadding: const EdgeInsets.only(
                  left: 16,
                  right: 12,
                ),
                trailing: LinearLayout(
                  orientation: Axis.horizontal,
                  crossGravity: CrossAxisAlignment.center,
                  children: [
                    TextView(
                      text: "BDT 50.0/Month",
                      textColor: Colors.white.t75,
                      textSize: 12,
                      marginEnd: 4,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        TitledView(
          marginTop: 32,
          titleColor: Colors.white.t50,
          title: "Or Redeem Code",
          marginHorizontal: 12,
          clipBehavior: Clip.antiAlias,
          child: LinearLayout(
            marginTop: 8,
            orientation: Axis.horizontal,
            crossGravity: CrossAxisAlignment.center,
            children: [
              EditText(
                flex: 1,
                hint: "Enter your coupon",
                textOverflow: TextOverflow.ellipsis,
                textColor: Colors.white.t50,
                borderRadius: 4,
                borderColor: Colors.white.t50,
                borderSize: 1.5,
                paddingVertical: 12,
                paddingHorizontal: 12,
              ),
              const SizedBox(
                width: 16,
              ),
              TextView(
                flex: 1,
                text: "Redeem Code",
                textAllCaps: true,
                background: Colors.red.t50,
                borderRadius: 4,
                gravity: Alignment.center,
                textSize: 14,
                paddingVertical: 12,
                textFontWeight: FontWeight.w700,
                textColor: Colors.white.t50,
              ),
            ],
          ),
        ),
        TextView(
          text: "Already Subscription?",
          textColor: Colors.white.t50,
          textSize: 16,
          paddingVertical: 32,
          width: double.infinity,
          gravity: Alignment.center,
        ),
      ],
    );
  }
}
