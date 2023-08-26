part of '../widgets.dart';

class ImageButton extends StatelessWidget {
  final double margin;
  final double? marginHorizontal, marginVertical;
  final double? marginTop, marginBottom, marginStart, marginEnd;
  final double padding, borderRadius;
  final bool enabled;
  final dynamic src;
  final double size;
  final Color? background, rippleColor, pressedColor, tint;
  final BoxFit? fit;
  final IBIconType type;

  final IconData? Function(IBState state)? iconState;
  final Color? Function(IBState state)? tintState;
  final Color? Function(IBState state)? backgroundState;

  final Function(BuildContext context)? onClick;

  const ImageButton({
    super.key,
    this.fit,
    this.padding = 8,
    this.margin = 0,
    this.marginHorizontal,
    this.marginVertical,
    this.marginTop,
    this.marginBottom,
    this.marginStart,
    this.marginEnd,
    this.borderRadius = 25,
    this.enabled = true,
    this.onClick,
    this.src,
    this.size = 24,
    this.iconState,
    this.tint,
    this.tintState,
    this.background = Colors.transparent,
    this.backgroundState,
    this.rippleColor,
    this.pressedColor = const Color(0xFFF2F2F2),
    this.type = IBIconType.detect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: marginHorizontal ?? marginStart ?? margin,
        right: marginHorizontal ?? marginEnd ?? margin,
        top: marginVertical ?? marginTop ?? margin,
        bottom: marginVertical ?? marginBottom ?? margin,
      ),
      child: Material(
        color: backgroundState?.call(state) ?? background,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: enabled ? () => onClick?.call(context) : null,
          splashColor: rippleColor,
          highlightColor: pressedColor,
          hoverColor: pressedColor,
          child: AbsorbPointer(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(padding),
              child: _IBIcon(
                icon: src,
                size: size,
                tint: tint,
                fit: fit,
                type: type,
              ),
            ),
          ),
        ),
      ),
    );
  }

  IBState get state {
    if (enabled && onClick != null) {
      return IBState.enabled;
    } else {
      return IBState.disabled;
    }
  }
}

class _IBIcon extends StatelessWidget {
  final dynamic icon;
  final IBIconType type;
  final Color? tint;
  final double? size;
  final BoxFit? fit;

  const _IBIcon({
    Key? key,
    required this.icon,
    this.type = IBIconType.detect,
    this.tint,
    this.size,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case IBIconType.icon:
        return Icon(
          icon,
          color: tint,
          size: size,
        );
      case IBIconType.svg:
        return SvgPicture.asset(
          icon,
          theme: SvgTheme(currentColor: tint ?? Colors.black),
          width: size,
          height: size,
          fit: fit ?? BoxFit.contain,
        );
      case IBIconType.image:
        return Image.asset(
          icon,
          color: tint,
          width: size,
          height: size,
          fit: fit,
        );
      default:
        return Container(
          color: tint,
          width: size,
          height: size,
        );
    }
  }

  IBIconType get _type {
    final data = icon;
    if (type == IBIconType.detect) {
      if (data is IconData) {
        return IBIconType.icon;
      } else if (data is String) {
        if (data.contains('.svg')) {
          return IBIconType.svg;
        } else if (data.contains('.png') ||
            data.contains('.jpg') ||
            data.contains('.jpeg') ||
            data.contains('.webp')) {
          return IBIconType.image;
        } else {
          return type;
        }
      } else {
        return type;
      }
    } else {
      return type;
    }
  }
}

enum IBIconType {
  detect,
  icon,
  svg,
  image,
}

enum IBState {
  disabled,
  enabled,
}
