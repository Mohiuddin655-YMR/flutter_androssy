part of '../widgets.dart';

class NullableView extends YMRView<NullableViewController> {
  ///IMAGE
  final dynamic icon;
  final Color? iconTint;
  final BlendMode iconTintMode;
  final double iconSize;
  final double iconSpacing;
  final bool iconVisible;
  final IconViewController? iconController;

  ///HEADER
  final String? header;
  final Color headerColor;
  final String? headerFontFamily;
  final FontWeight headerFontWeight;
  final double headerSize;
  final bool headerVisible;
  final TextViewController? headerController;

  ///BODY
  final String? body;
  final Color bodyColor;
  final String? bodyFontFamily;
  final FontWeight bodyFontWeight;
  final double bodySize;
  final double bodySpacing;
  final bool bodyVisible;
  final TextViewController? bodyController;

  ///BUTTON
  final Color? buttonBackground;
  final double buttonMinWidth;
  final double buttonPaddingX;
  final double buttonPaddingY;
  final String? buttonText;
  final Color buttonTextColor;
  final String? buttonTextFontFamily;
  final FontWeight buttonTextFontWeight;
  final double buttonTextSize;
  final double buttonSpacing;
  final bool buttonVisible;
  final ButtonController? buttonController;
  final OnViewClickListener? onButtonClick;

  const NullableView({
    super.key,
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
    super.border,
    super.borderHorizontal,
    super.borderVertical,
    super.borderTop,
    super.borderBottom,
    super.borderStart,
    super.borderEnd,
    super.borderColor,
    super.borderGradient,
    super.borderRadius,
    super.borderRadiusBL,
    super.borderRadiusBR,
    super.borderRadiusTL,
    super.borderRadiusTR,
    super.clipBehavior,
    super.controller,
    super.dimensionRatio,
    super.enabled,
    super.elevation,
    super.expandable,
    super.foreground,
    super.foregroundBlendMode,
    super.foregroundGradient,
    super.foregroundImage,
    super.flex,
    super.height,
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
    super.widthMax,
    super.widthMin,
    super.visibility,
    this.icon,
    this.iconTint,
    this.iconTintMode = BlendMode.srcIn,
    this.iconSize = 50,
    this.iconSpacing = 24,
    this.iconVisible = true,
    this.iconController,
    this.header,
    this.headerColor = Colors.black,
    this.headerFontFamily,
    this.headerFontWeight = FontWeight.w500,
    this.headerSize = 24,
    this.headerVisible = true,
    this.headerController,
    this.body,
    this.bodyColor = const Color(0xff808080),
    this.bodyFontFamily,
    this.bodyFontWeight = FontWeight.normal,
    this.bodySize = 16,
    this.bodySpacing = 12,
    this.bodyVisible = true,
    this.bodyController,
    this.buttonBackground,
    this.buttonMinWidth = 180,
    this.buttonPaddingX = 24,
    this.buttonPaddingY = 12,
    this.buttonText,
    this.buttonTextColor = Colors.white,
    this.buttonTextFontFamily,
    this.buttonTextFontWeight = FontWeight.w500,
    this.buttonTextSize = 16,
    this.buttonSpacing = 24,
    this.buttonVisible = true,
    this.buttonController,
    this.onButtonClick,
  });

  @override
  NullableViewController initController() => NullableViewController();

  @override
  NullableViewController attachController(NullableViewController controller) {
    return controller.fromErrorView(this);
  }

  @override
  Widget? attach(BuildContext context, NullableViewController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconView(
          controller: iconController,
          visibility: controller.iconVisible,
          marginBottom: controller.iconSpacing,
          icon: controller.icon,
          size: controller.iconSize,
          tint: controller.iconTint,
          tintMode: controller.iconTintMode,
        ),
        TextView(
          controller: headerController,
          visibility: controller.headerVisible,
          width: double.infinity,
          gravity: Alignment.center,
          text: controller.header,
          textColor: controller.headerColor,
          textAlign: TextAlign.center,
          textFontFamily: controller.headerFontFamily,
          textFontWeight: controller.headerFontWeight,
          textSize: controller.headerSize,
        ),
        TextView(
          controller: bodyController,
          visibility: controller.bodyVisible,
          width: double.infinity,
          gravity: Alignment.center,
          marginTop: controller.bodySpacing,
          text: controller.body,
          textAlign: TextAlign.center,
          textColor: controller.bodyColor,
          textFontFamily: controller.bodyFontFamily,
          textFontWeight: controller.bodyFontWeight,
          textSize: controller.bodySize,
        ),
        Button(
          controller: buttonController,
          visibility: controller.buttonVisible,
          marginTop: controller.buttonSpacing,
          background: controller.buttonBackground ?? context.primaryColor,
          widthMin: controller.buttonMinWidth,
          paddingHorizontal: controller.buttonPaddingX,
          paddingVertical: controller.buttonPaddingY,
          ripple: 10,
          rippleColor: Colors.black26,
          pressedColor: Colors.black26,
          borderRadius: 50,
          text: controller.buttonText,
          textColor: controller.buttonTextColor,
          textFontWeight: controller.buttonTextFontWeight,
          textSize: controller.buttonTextSize,
          onClick: onButtonClick,
        ),
      ],
    );
  }
}

class NullableViewController extends ViewController {
  ///IMAGE
  dynamic icon;
  Color? iconTint;
  BlendMode? iconTintMode = BlendMode.srcIn;
  double? iconSize = 50;
  double iconSpacing = 24;
  bool _iconVisible = true;

  bool get iconVisible => icon != null && _iconVisible;

  ///HEADER
  String? header;
  Color headerColor = Colors.black;
  String? headerFontFamily;
  FontWeight headerFontWeight = FontWeight.w500;
  double headerSize = 24;
  bool _headerVisible = true;

  bool get headerVisible => (header ?? "").isNotEmpty && _headerVisible;

  ///BODY
  String? body;
  Color bodyColor = const Color(0xff808080);
  String? bodyFontFamily;
  FontWeight? bodyFontWeight;
  double bodySize = 16;
  double bodySpacing = 12;
  bool _bodyVisible = true;

  bool get bodyVisible => (body ?? "").isNotEmpty && _bodyVisible;

  ///BUTTON
  Color? buttonBackground;
  double buttonMinWidth = 180;
  double buttonPaddingX = 24;
  double buttonPaddingY = 12;
  String? buttonText;
  Color buttonTextColor = Colors.white;
  String? buttonTextFontFamily;
  FontWeight buttonTextFontWeight = FontWeight.w500;
  double buttonTextSize = 16;
  double buttonSpacing = 24;
  bool _buttonVisible = false;

  bool get buttonVisible => (buttonText ?? "").isNotEmpty && _buttonVisible;

  @override
  double get paddingHorizontal => super.paddingHorizontal ?? 24;

  @override
  double get paddingVertical => super.paddingVertical ?? 50;

  @override
  Alignment get gravity => super.gravity ?? Alignment.center;

  NullableViewController fromErrorView(NullableView view) {
    super.fromView(view);

    ///ICON
    icon = view.icon;
    iconTint = view.iconTint;
    iconTintMode = view.iconTintMode;
    iconSize = view.iconSize;
    iconSpacing = view.iconSpacing;
    _iconVisible = view.iconVisible;

    ///HEADER
    header = view.header;
    headerColor = view.headerColor;
    headerFontFamily = view.headerFontFamily;
    headerFontWeight = view.headerFontWeight;
    headerSize = view.headerSize;
    _headerVisible = view.headerVisible;

    ///BODY
    body = view.body;
    bodyColor = view.bodyColor;
    bodyFontFamily = view.bodyFontFamily;
    bodyFontWeight = view.bodyFontWeight;
    bodySize = view.bodySize;
    bodySpacing = view.bodySpacing;
    _bodyVisible = view.bodyVisible;

    ///BUTTON
    buttonBackground = view.buttonBackground;
    buttonMinWidth = view.buttonMinWidth;
    buttonPaddingX = view.buttonPaddingX;
    buttonPaddingY = view.buttonPaddingY;
    buttonText = view.buttonText;
    buttonTextColor = view.buttonTextColor;
    buttonTextFontFamily = view.buttonTextFontFamily;
    buttonTextFontWeight = view.buttonTextFontWeight;
    buttonTextSize = view.buttonTextSize;
    buttonSpacing = view.buttonSpacing;
    _buttonVisible = view.buttonVisible;
    return this;
  }
}
