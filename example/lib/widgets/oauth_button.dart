import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';

class AppOAuthButton extends StatelessWidget {
  final ButtonController? controller;
  final String text;
  final dynamic icon;
  final OnViewClickListener? onClick;

  const AppOAuthButton({
    super.key,
    this.controller,
    required this.text,
    this.icon,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      controller: controller,
      marginTop: 24,
      width: double.infinity,
      borderRadius: 6,
      background: Colors.transparent,
      paddingVertical: 6,
      borderSize: 1,
      borderColor: context.primaryColor,
      text: text,
      textColor: Colors.black,
      icon: icon,
      iconSize: 18,
      iconColorEnabled: false,
      iconAlignment: IconAlignment.start,
      onClick: onClick,
    );
  }
}
