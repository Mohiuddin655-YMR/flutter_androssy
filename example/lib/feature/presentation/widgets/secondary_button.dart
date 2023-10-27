import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';

class SecondaryButton extends StatelessWidget {
  final double? marginTop;
  final String text;
  final OnViewClickListener? onClick;

  const SecondaryButton({
    super.key,
    this.marginTop,
    required this.text,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      marginTop: marginTop,
      text: text,
      textColor: Colors.white,
      textSize: 14,
      textFontWeight: FontWeight.bold,
      gravity: Alignment.center,
      background: context.colorScheme.background.withOpacity(0.1),
      borderSize: 1.5,
      borderRadius: 8,
      borderColor: context.colorScheme.primary,
      rippleColor: Colors.white12,
      onClick: onClick,
    );
  }
}
