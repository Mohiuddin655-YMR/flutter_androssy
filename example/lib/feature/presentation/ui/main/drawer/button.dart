import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';

class HomeDrawerButton extends StatelessWidget {
  final bool isSelected;
  final dynamic icon;
  final String? text;
  final OnViewClickListener onClick;

  const HomeDrawerButton({
    super.key,
    this.isSelected = false,
    this.icon,
    this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return LinearLayout(
      width: double.infinity,
      orientation: Axis.horizontal,
      crossGravity: CrossAxisAlignment.center,
      rippleColor: Colors.white12,
      pressedColor: Colors.white12,
      background: Colors.transparent,
      paddingVertical: 8,
      paddingHorizontal: 16,
      height: 44,
      onClick: (_) {
        onClick(_);
        Navigator.pop(context);
      },
      children: [
        YMRView(
          width: 4,
          borderRadius: 8,
          marginEnd: 8,
          height: double.infinity,
          background: isSelected ? context.primaryColor : Colors.transparent,
        ),
        IconView(
          icon: icon,
          size: 24,
          tint: Colors.white,
          marginEnd: 8,
        ),
        TextView(
          text: text,
          textColor: Colors.white,
          textSize: 16,
        )
      ],
    );
  }
}
