part of '../widgets.dart';

class ButtonController extends TextViewController {
  dynamic _icon;

  set icon(dynamic value) => _icon = value;

  void setIcon(dynamic value) {
    onNotifyWithCallback(() => icon = value);
  }

  ValueState<dynamic>? iconState;

  void setIconState(ValueState<dynamic>? value) {
    onNotifyWithCallback(() => iconState = value);
  }

  IconAlignment iconAlignment = IconAlignment.end;

  void setIconAlignment(IconAlignment value) {
    onNotifyWithCallback(() => iconAlignment = value);
  }

  bool iconFlexible = false;

  void setIconFlexible(bool value) {
    onNotifyWithCallback(() => iconFlexible = value);
  }

  bool iconOnly = false;

  void setIconOnly(bool value) {
    onNotifyWithCallback(() => iconOnly = value);
  }

  double? _iconSize;

  set iconSize(double? value) => _iconSize = value;

  void setIconSize(double? value) {
    onNotifyWithCallback(() => iconSize = value);
  }

  ValueState<double>? iconSizeState;

  void setIconSizeState(ValueState<double>? value) {
    onNotifyWithCallback(() => iconSizeState = value);
  }

  double? _iconSpace;

  set iconSpace(double? value) => _iconSpace = value;

  void setIconSpace(double value) {
    onNotifyWithCallback(() => iconSpace = value);
  }

  Color? _iconTint;

  set iconTint(Color? value) => _iconTint = value;

  void setIconTint(Color? value) {
    onNotifyWithCallback(() => iconTint = value);
  }

  ValueState<Color>? iconTintState;

  void setIconTintState(ValueState<Color>? value) {
    onNotifyWithCallback(() => iconTintState = value);
  }

  bool iconTintEnabled = true;

  void setIconTintEnabled(bool value) {
    onNotifyWithCallback(() => iconTintEnabled = value);
  }

  bool textCenter = false;

  void setTextCenter(bool value) {
    onNotifyWithCallback(() => textCenter = value);
  }

  ButtonController fromButton(Button view) {
    super.fromTextView(view);
    icon = view.icon;
    iconState = view.iconState;
    iconAlignment = view.iconAlignment;
    iconFlexible = view.iconFlexible;
    iconOnly = view.iconOnly;
    iconSize = view.iconSize;
    iconSizeState = view.iconSizeState;
    iconSpace = view.iconSpace;
    iconTint = view.iconTint;
    iconTintState = view.iconTintState;
    iconTintEnabled = view.iconTintEnabled;
    textCenter = view.textCenter;
    return this;
  }

  dynamic get icon => iconState?.fromController(this) ?? _icon;

  double get iconSize {
    return iconSizeState?.fromController(this) ??
        _iconSize ??
        (textSize ?? 0) * 1.2;
  }

  double get iconSpace => _iconSpace ?? (iconOnly ? 0 : 16);

  Color? get iconTint => iconTintEnabled
      ? iconTintState?.fromController(this) ?? _iconTint ?? color
      : null;

  bool get isCenterText => textCenter;

  get isStartIconVisible => iconAlignment.isStart && icon != null;

  bool get isEndIconVisible => iconAlignment.isEnd && icon != null;

  bool get isStartIconFlex => isStartIconVisible && iconFlexible;

  bool get isEndIconFlex => isEndIconVisible && iconFlexible;

  Color? get color {
    var I = textColorState?.fromController(this) ?? textColor;
    if (I == null) {
      return enabled && isObservable
          ? activated
              ? theme.primaryColor
              : isBorder
                  ? theme.primaryColor
                  : Colors.white
          : Colors.grey.shade400;
    }
    return I;
  }

  @override
  Color? get background {
    if (super.background == null) {
      return enabled && isObservable
          ? activated
              ? theme.primaryColor.withOpacity(0.1)
              : theme.primaryColor
          : Colors.grey.shade200;
    }
    return super.background;
  }

  @override
  Color? get borderColor {
    if (super.borderColor == null) {
      return enabled && isObservable
          ? activated
              ? theme.primaryColor.withOpacity(0.1)
              : theme.primaryColor
          : Colors.grey.shade200;
    }
    return super.background;
  }

  @override
  double? get paddingHorizontal {
    final x = width ?? 0;
    final y = x == double.infinity || x > 0;
    return y ? super.paddingHorizontal : super.paddingHorizontal ?? 24;
  }

  @override
  double? get paddingVertical {
    final x = height ?? 0;
    final y = x == double.infinity || x > 0;
    return y ? super.paddingVertical : super.paddingVertical ?? 12;
  }
}

class Button<T extends ButtonController> extends TextView<T> {
  final dynamic icon;
  final ValueState<dynamic>? iconState;
  final IconAlignment iconAlignment;
  final bool iconFlexible;
  final bool iconOnly;
  final Color? iconTint;
  final double? iconSize;
  final ValueState<double>? iconSizeState;
  final ValueState<Color>? iconTintState;
  final bool iconTintEnabled;
  final double? iconSpace;
  final bool textCenter;

  const Button({
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
    super.height,
    super.heightState,
    super.heightMax,
    super.heightMin,
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
    super.width,
    super.widthState,
    super.widthMax,
    super.widthMin,
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

    /// SUPER TEXT PROPERTIES
    super.text,
    super.textSize,
    super.textFontWeight,
    super.textStyle,
    super.textAllCaps,
    super.textColor,
    super.textColorState,
    super.textState,

    /// CHILD PROPERTIES
    this.icon,
    this.iconState,
    this.iconAlignment = IconAlignment.end,
    this.iconFlexible = false,
    this.iconOnly = false,
    this.iconSize,
    this.iconSizeState,
    this.iconTint,
    this.iconTintState,
    this.iconTintEnabled = true,
    this.iconSpace,
    this.textCenter = false,
  });

  @override
  T initController() => ButtonController() as T;

  @override
  T attachController(T controller) => controller.fromButton(this) as T;

  @override
  Widget? attach(BuildContext context, T controller) {
    if (controller.iconOnly) {
      return _Icon(
        controller: controller,
        visible: controller.icon != null,
      );
    }
    return controller.isCenterText
        ? Stack(
            alignment: Alignment.center,
            children: [
              _Text(controller: controller),
              _Icon(
                controller: controller,
                visible: controller.icon != null,
              ),
            ],
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Icon(
                controller: controller,
                visible: controller.isStartIconVisible,
              ),
              if (controller.isStartIconFlex) const Spacer(),
              _Text(controller: controller),
              if (controller.isEndIconFlex) const Spacer(),
              _Icon(
                controller: controller,
                visible: controller.isEndIconVisible,
              ),
            ],
          );
  }
}

class _Text extends StatelessWidget {
  final ButtonController controller;

  const _Text({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return RawTextView(
      text: controller.text,
      textAlign: TextAlign.center,
      textColor: controller.color,
      textSize: controller.textSize,
      textFontWeight: controller.textFontWeight,
      textStyle: controller.textStyle,
    );
  }
}

class _Icon extends StatelessWidget {
  final ButtonController controller;
  final bool visible;

  const _Icon({
    required this.controller,
    this.visible = true,
  });

  @override
  Widget build(BuildContext context) {
    return IconView(
      visibility: visible,
      marginStart: !controller.isCenterText && controller.isEndIconVisible
          ? controller.iconSpace
          : null,
      marginEnd: !controller.isCenterText && controller.isStartIconVisible
          ? controller.iconSpace
          : null,
      positionType: controller.isCenterText
          ? controller.isEndIconVisible
              ? ViewPositionType.right
              : ViewPositionType.left
          : null,
      icon: controller.icon,
      tint: controller.iconTint,
      size: controller.iconSize,
    );
  }
}

enum IconAlignment { start, end }

extension IconAlignException on IconAlignment {
  bool get isStart => this == IconAlignment.start;

  bool get isEnd => this == IconAlignment.end;
}
