part of '../widgets.dart';

class IconView extends YMRView<IconViewController> {
  final BoxFit fit;
  final dynamic icon;
  final ValueState<dynamic>? iconState;
  final double size;
  final ValueState<double>? sizeState;
  final Color? tint;
  final ValueState<Color>? tintState;
  final BlendMode tintMode;

  const IconView({
    /// BASE PROPERTIES
    super.key,
    super.controller,

    /// BORDER PROPERTIES
    super.borderColor,
    super.borderColorState,
    super.borderSize,
    super.borderSizeState,
    super.borderHorizontal,
    super.borderHorizontalState,
    super.borderVertical,
    super.borderVerticalState,
    super.borderTop,
    super.borderTopState,
    super.borderBottom,
    super.borderBottomState,
    super.borderStart,
    super.borderStartState,
    super.borderEnd,
    super.borderEndState,

    /// BORDER RADIUS PROPERTIES
    super.borderRadius,
    super.borderRadiusState,
    super.borderRadiusBL,
    super.borderRadiusBLState,
    super.borderRadiusBR,
    super.borderRadiusBRState,
    super.borderRadiusTL,
    super.borderRadiusTLState,
    super.borderRadiusTR,
    super.borderRadiusTRState,

    ///
    ///
    ///
    ///
    super.absorbMode,
    super.activated,
    super.animation,
    super.animationType,
    super.background,
    super.backgroundState,
    super.backgroundBlendMode,
    super.backgroundGradient,
    super.backgroundGradientState,
    super.backgroundImage,
    super.backgroundImageState,
    super.clipBehavior,
    super.dimensionRatio,
    super.elevation,
    super.enabled,
    super.foreground,
    super.foregroundBlendMode,
    super.foregroundGradient,
    super.foregroundImage,
    super.flex,
    super.gravity = Alignment.center,
    super.hoverColor,
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,
    super.padding,
    super.position,
    super.positionType,
    super.pressedColor,
    super.rippleColor,
    super.shadow,
    super.shadowBlurRadius,
    super.shadowBlurStyle,
    super.shadowColor,
    super.shadowType,
    super.shadowSpreadRadius,
    super.shadowHorizontal,
    super.shadowVertical,
    super.shadowStart,
    super.shadowEnd,
    super.shadowTop,
    super.shadowBottom,
    super.shape,
    super.transform,
    super.transformGravity,
    super.visibility,
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onToggle,
    super.onHover,
    this.icon,
    this.fit = BoxFit.contain,
    this.iconState,
    this.size = 24,
    this.sizeState,
    this.tint,
    this.tintState,
    this.tintMode = BlendMode.srcIn,
  });

  @override
  IconViewController initController() {
    return IconViewController();
  }

  @override
  IconViewController attachController(IconViewController controller) {
    return controller.fromIconView(this);
  }

  @override
  Widget? attach(BuildContext context, IconViewController controller) {
    return RawIconView(
      fit: controller.fit,
      icon: controller.icon,
      size: controller.iconSize,
      tint: controller.tint,
      tintMode: controller.tintMode,
    );
  }
}

class IconViewController extends ViewController {
  BoxFit fit = BoxFit.contain;
  dynamic _icon;
  ValueState<dynamic>? iconState;
  double _size = 24;
  ValueState<double>? iconSizeState;
  Color? _tint;
  ValueState<Color>? tintState;
  BlendMode tintMode = BlendMode.srcIn;

  IconViewController fromIconView(IconView view) {
    super.fromView(view);
    fit = view.fit;
    _icon = view.icon;
    iconState = view.iconState;
    _size = view.size;
    _tint = view.tint;
    tintState = view.tintState;
    tintMode = view.tintMode;
    return this;
  }

  dynamic get icon => iconState?.fromController(this) ?? _icon;

  double get size => iconSizeState?.fromController(this) ?? _size;

  double get iconSize => size - (paddingAll / 2);

  Color? get tint => tintState?.fromController(this) ?? _tint;

  @override
  double get width => size;

  @override
  double get height => size;

  void setIcon(dynamic value) {
    onNotifyWithCallback(() => _icon = value);
  }

  void setIconSize(double value) {
    onNotifyWithCallback(() => _size = value);
  }

  void setIconTint(Color value) {
    onNotifyWithCallback(() => _tint = value);
  }

  void setIconTintState(ValueState<Color>? value) {
    onNotifyWithCallback(() => tintState = value);
  }
}

class RawIconView extends StatelessWidget {
  final BoxFit? fit;
  final dynamic icon;
  final double? size;
  final Color? tint;
  final BlendMode tintMode;

  const RawIconView({
    super.key,
    required this.icon,
    this.fit,
    this.size,
    this.tint,
    this.tintMode = BlendMode.srcIn,
  });

  @override
  Widget build(BuildContext context) {
    final type = getType(icon);
    switch (type) {
      case IconType.icon:
        return Icon(
          icon,
          color: tint,
          size: size,
        );
      case IconType.svg:
        return SvgPicture.asset(
          icon,
          width: size,
          height: size,
          fit: fit ?? BoxFit.contain,
          colorFilter: tint != null
              ? ColorFilter.mode(
                  tint!,
                  tintMode,
                )
              : null,
          theme: SvgTheme(
            currentColor: tint ?? const Color(0xFF808080),
          ),
        );
      case IconType.png:
        return Image.asset(
          icon,
          color: tint,
          width: size,
          height: size,
          fit: fit,
          colorBlendMode: tintMode,
        );
      default:
        return SizedBox(
          width: size,
          height: size,
        );
    }
  }

  IconType getType(dynamic source) {
    if (source is IconData) {
      return IconType.icon;
    } else if (source is String) {
      if (source.endsWith('.svg')) {
        return IconType.svg;
      } else if (source.endsWith('.png')) {
        return IconType.png;
      } else {
        return IconType.none;
      }
    } else {
      return IconType.none;
    }
  }
}

enum IconType { none, icon, svg, png }
