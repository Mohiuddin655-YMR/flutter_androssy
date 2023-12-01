part of '../widgets.dart';

class IconViewController extends ViewController {
  BoxFit fit = BoxFit.contain;

  void setIconFit(BoxFit value) {
    onNotifyWithCallback(() => fit = value);
  }

  dynamic _icon;

  set icon(dynamic value) => _icon = value;

  void setIcon(dynamic value) {
    onNotifyWithCallback(() => icon = value);
  }

  ValueState<dynamic>? iconState;

  void setIconState(ValueState<dynamic>? value) {
    onNotifyWithCallback(() => iconState = value);
  }

  double _size = 24;

  set size(double value) => _size = value;

  void setIconSize(double value) {
    onNotifyWithCallback(() => size = value);
  }

  ValueState<double>? iconSizeState;

  void setIconSizeState(ValueState<double>? value) {
    onNotifyWithCallback(() => iconSizeState = value);
  }

  Color? _tint;

  set tint(Color? value) => _tint = value;

  void setIconTint(Color value) {
    onNotifyWithCallback(() => tint = value);
  }

  ValueState<Color>? tintState;

  void setIconTintState(ValueState<Color>? value) {
    onNotifyWithCallback(() => tintState = value);
  }

  BlendMode tintMode = BlendMode.srcIn;

  void setIconTintMode(BlendMode value) {
    onNotifyWithCallback(() => tintMode = value);
  }

  IconViewController fromIconView(IconView view) {
    super.fromView(view);
    fit = view.fit;
    icon = view.icon;
    iconState = view.iconState;
    size = view.size;
    tint = view.tint;
    tintState = view.tintState;
    tintMode = view.tintMode;
    return this;
  }

  dynamic get icon => iconState?.fromController(this) ?? _icon;

  double get size => iconSizeState?.fromController(this) ?? _size;

  double get iconSize => size - (paddingAll / 2);

  Color? get tint => tintState?.fromController(this) ?? _tint;
}

class IconView<T extends IconViewController> extends YMRView<T> {
  final BoxFit fit;
  final dynamic icon;
  final ValueState<dynamic>? iconState;
  final double size;
  final ValueState<double>? sizeState;
  final Color? tint;
  final ValueState<Color>? tintState;
  final BlendMode tintMode;

  const IconView({
    /// ROOT PROPERTIES
    super.key,
    super.controller,

    ///BASE PROPERTIES
    super.absorbMode,
    super.activated,
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
    super.expandable,
    super.foreground,
    super.foregroundBlendMode,
    super.foregroundGradient,
    super.foregroundImage,
    super.flex,
    super.gravity,
    super.hoverColor,
    super.orientation,
    super.position,
    super.positionType,
    super.pressedColor,
    super.rippleColor,
    super.scrollable,
    super.scrollController,
    super.scrollingType,
    super.shape,
    super.transform,
    super.transformGravity,
    super.visibility,

    /// ANIMATION PROPERTIES
    super.animation,
    super.animationType,

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
    super.borderStrokeAlign,

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

    /// MARGIN PROPERTIES
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,

    /// PADDING PROPERTIES
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,

    /// SHADOW PROPERTIES
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

    /// LISTENER PROPERTIES
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onHover,
    super.onToggle,

    /// CHILD PROPERTIES
    this.icon,
    this.fit = BoxFit.contain,
    this.iconState,
    this.size = 24,
    this.sizeState,
    this.tint,
    this.tintState,
    this.tintMode = BlendMode.srcIn,
  }) : super(width: size, height: size);

  @override
  T initController() => IconViewController() as T;

  @override
  T attachController(T controller) => controller.fromIconView(this) as T;

  @override
  Widget? attach(BuildContext context, T controller) {
    return RawIconView(
      fit: controller.fit,
      icon: controller.icon,
      size: controller.iconSize,
      tint: controller.tint,
      tintMode: controller.tintMode,
    );
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
