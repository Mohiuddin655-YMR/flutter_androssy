import 'package:flutter/material.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';

class PrimaryButton extends StatelessWidget {
  final ButtonController? controller;
  final double marginTop;
  final String text;
  final OnViewClickListener? onClick;

  const PrimaryButton({
    super.key,
    this.controller,
    required this.text,
    this.marginTop = 24,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      controller: controller,
      elevation: 3,
      rippleColor: Colors.black12,
      onClick: onClick,
      text: text,
      textFontWeight: FontWeight.bold,
      width: double.infinity,
      borderRadius: 4,
      marginTop: marginTop,
    );
  }
}
