import 'package:badges/badges.dart' as b;
import 'package:flutter/material.dart';

class BadgeButton extends StatelessWidget {
  final EdgeInsets? margin;
  final bool badgeShow;
  final int counter;
  final Color? badgeTextColor;
  final double? badgeTextSize;
  final double? badgeBorderRadius;
  final double? badgePadding;
  final double? badgeMargin;
  final double? badgeWidth, badgeHeight;
  final BadgeAlign badgeAlign;
  final double? borderRadius;
  final double? paddingSize;
  final Color? badgeBackground;
  final Widget child;
  final String Function(int value)? badgeText;
  final Function()? onClick;

  const BadgeButton({
    super.key,
    required this.child,
    required this.counter,
    this.margin,
    this.badgeShow = true,
    this.badgeText,
    this.badgeTextColor,
    this.badgeTextSize,
    this.badgePadding,
    this.badgeMargin,
    this.badgeAlign = BadgeAlign.top,
    this.borderRadius,
    this.paddingSize,
    this.badgeBackground,
    this.onClick,
    this.badgeBorderRadius,
    this.badgeWidth,
    this.badgeHeight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bp = badgePadding ?? 4;
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      onTap: () => onClick?.call(),
      child: AbsorbPointer(
        child: Padding(
          padding: EdgeInsets.all(paddingSize ?? 8),
          child: b.Badge(
            showBadge: badgeShow && counter > 0,
            badgeStyle: const b.BadgeStyle(
              badgeColor: Colors.transparent,
              elevation: 0,
              padding: EdgeInsets.zero,
            ),
            badgeAnimation: const b.BadgeAnimation.fade(),
            position: _position,
            badgeContent: Container(
              constraints: BoxConstraints(
                minWidth: badgeWidth ?? 20,
                minHeight: badgeHeight ?? 20,
              ),
              decoration: BoxDecoration(
                color: badgeBackground ?? theme.primaryColor,
                borderRadius: BorderRadius.circular(badgeBorderRadius ?? 16),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: bp,
                vertical: bp * 0.5,
              ),
              child: Center(
                child: Text(
                  badgeText?.call(counter) ??
                      (counter < 100 ? "$counter" : "99"),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  style: TextStyle(
                    color: badgeTextColor ?? Colors.white,
                    fontSize: badgeTextSize ?? 12,
                  ),
                ),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  b.BadgePosition get _position {
    final size = -(badgeMargin ?? 8);
    switch (badgeAlign) {
      case BadgeAlign.top:
        return b.BadgePosition.topEnd(end: size, top: size);
      case BadgeAlign.center:
        return b.BadgePosition.center();
      case BadgeAlign.bottom:
        return b.BadgePosition.bottomEnd(bottom: size, end: size);
      case BadgeAlign.topStart:
        return b.BadgePosition.topStart(top: size, start: size);
      case BadgeAlign.bottomStart:
        return b.BadgePosition.bottomStart(bottom: size, start: size);
      case BadgeAlign.centerTop:
        return b.BadgePosition.custom(top: size, end: 0, start: 0);
      case BadgeAlign.centerBottom:
        return b.BadgePosition.custom(bottom: size, end: 0, start: 0);
    }
  }
}

enum BadgeAlign {
  top,
  center,
  bottom,
  centerTop,
  centerBottom,
  topStart,
  bottomStart,
}
