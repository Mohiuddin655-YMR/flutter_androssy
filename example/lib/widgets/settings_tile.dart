import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';

class SettingTile extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Widget? content;
  final Widget? leading;
  final Widget? tailing;
  final Widget? subscription;
  final OnViewClickListener? onClick;

  const SettingTile({
    super.key,
    this.header,
    this.body,
    this.content,
    this.leading,
    this.tailing,
    this.subscription,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return LinearLayout(
      background: Colors.white,
      paddingVertical: 12,
      orientation: Axis.horizontal,
      crossGravity: CrossAxisAlignment.center,
      paddingStart: 24,
      paddingEnd: 16,
      pressedColor: Colors.black.t05,
      rippleColor: Colors.black.t05,
      onClick: onClick,
      children: [
        if (leading != null) leading!,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (header != null) header!,
              if (body != null) body!,
            ],
          ),
        ),
        if (content != null) content!,
        if (tailing != null) tailing!,
      ],
    );
  }
}
