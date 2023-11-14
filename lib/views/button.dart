part of '../widgets.dart';

class Button extends TextView<ButtonController> {
  final bool? centerText;
  final bool? iconOnly;
  final dynamic icon;
  final ValueState<dynamic>? iconState;
  final Color? iconColor;
  final ValueState<Color>? iconColorState;
  final bool? iconColorEnabled;
  final double? iconSize;
  final ValueState<double>? iconSizeState;
  final bool? iconFlexible;
  final double? iconSpace;
  final IconAlignment? iconAlignment;

  const Button({
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
    super.gravity,
    super.height,
    super.heightState,
    super.heightMax,
    super.heightMin,
    super.hoverColor,
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,
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
    super.width,
    super.widthState,
    super.widthMax,
    super.widthMin,
    super.visibility,
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onHover,
    super.onToggle,
    super.text,
    super.textSize,
    super.textFontWeight,
    super.textStyle,
    super.textAllCaps,
    super.textColor,
    super.textColorState,
    super.textState,
    this.centerText,
    this.iconOnly,
    this.iconFlexible,
    this.icon,
    this.iconState,
    this.iconSize,
    this.iconSizeState,
    this.iconColor,
    this.iconColorState,
    this.iconColorEnabled,
    this.iconSpace,
    this.iconAlignment,
  });

  @override
  ButtonController initController() {
    return ButtonController();
  }

  @override
  ButtonController attachController(ButtonController controller) {
    return controller.fromButton(this);
  }

  @override
  Widget? attach(BuildContext context, ButtonController controller) {
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

class ButtonController extends TextViewController {
  bool centerText = false;
  bool iconOnly = false;
  dynamic _icon;
  ValueState<dynamic>? iconState;
  double? _iconSize;
  ValueState<double>? iconSizeState;
  Color? _iconTint;
  ValueState<Color>? iconTintState;
  bool iconTintEnabled = true;
  bool expended = false;
  double? _iconSpace;
  IconAlignment iconAlignment = IconAlignment.end;

  ButtonController fromButton(Button view) {
    super.fromTextView(view);
    iconOnly = view.iconOnly ?? false;
    centerText = view.centerText ?? false;
    _icon = view.icon;
    iconState = view.iconState;
    _iconSize = view.iconSize;
    iconSizeState = view.iconSizeState;
    _iconTint = view.iconColor;
    iconTintState = view.iconColorState;
    iconTintEnabled = view.iconColorEnabled ?? true;
    expended = view.iconFlexible ?? false;
    _iconSpace = view.iconSpace;
    iconAlignment = view.iconAlignment ?? IconAlignment.end;
    return this;
  }

  dynamic get icon => iconState?.fromController(this) ?? _icon;

  double get iconSize =>
      iconSizeState?.fromController(this) ?? _iconSize ?? (textSize ?? 0) * 1.2;

  double get iconSpace => _iconSpace ?? (iconOnly ? 0 : 16);

  Color? get iconTint => iconTintEnabled
      ? iconTintState?.fromController(this) ?? _iconTint ?? color
      : null;

  bool get isCenterText => centerText;

  get isStartIconVisible => iconAlignment.isStart && icon != null;

  bool get isEndIconVisible => iconAlignment.isEnd && icon != null;

  bool get isStartIconFlex => isStartIconVisible && expended;

  bool get isEndIconFlex => isEndIconVisible && expended;

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

class _Text extends StatelessWidget {
  final ButtonController controller;

  const _Text({
    Key? key,
    required this.controller,
  }) : super(key: key);

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
    Key? key,
    required this.controller,
    this.visible = true,
  }) : super(key: key);

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
