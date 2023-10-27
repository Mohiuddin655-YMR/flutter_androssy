import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';

class PrimaryButton extends StatelessWidget {
  final double? marginTop;
  final String text;
  final OnViewClickListener? onClick;

  const PrimaryButton({
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
      background: context.primaryColor,
      borderRadius: 8,
      rippleColor: Colors.white12,
      onClick: onClick,
    );
  }
}
