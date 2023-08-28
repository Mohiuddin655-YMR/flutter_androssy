part of '../widgets.dart';

class AvatarView extends YMRView<AvatarViewController> {
  final String? url;
  final dynamic placeholder;
  final double? size;
  final bool? cacheMode;
  final bool? circular;
  final BoxFit? scaleType;
  final bool? borderOverlay;
  final Color? borderOverlayColor;
  final double? borderOverlaySize;

  const AvatarView({
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
    super.child,
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
    super.widthMax,
    super.widthMin,
    super.visibility,
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onToggle,
    this.url,
    this.placeholder,
    this.size,
    this.cacheMode,
    this.circular,
    this.scaleType,
    this.borderOverlay,
    this.borderOverlayColor,
    this.borderOverlaySize,
  });

  @override
  AvatarViewController initController() {
    return AvatarViewController();
  }

  @override
  AvatarViewController attachController(AvatarViewController controller) {
    return controller.fromView(
      this,
      borderOverlay: borderOverlay,
      borderOverlayColor: borderOverlayColor,
      borderOverlaySize: borderOverlaySize,
      borderSize: borderSize,
      cacheMode: cacheMode,
      circular: circular,
      placeholder: placeholder,
      size: size,
      scaleType: scaleType,
      url: url,
    );
  }

  @override
  Widget build(
    BuildContext context,
    AvatarViewController controller,
    Widget parent,
  ) {
    return ImageView(
      /// BASE PROPERTIES
      key: key,

      /// BORDER PROPERTIES
      borderColor: controller.borderColor,
      borderColorState: controller.borderColorState,
      borderSize: controller.borderSize,
      borderSizeState: controller.borderSizeState,
      borderHorizontal: controller.borderHorizontal,
      borderHorizontalState: controller.borderHorizontalState,
      borderVertical: controller.borderVertical,
      borderVerticalState: controller.borderVerticalState,
      borderTop: controller.borderTop,
      borderTopState: controller.borderTopState,
      borderBottom: controller.borderBottom,
      borderBottomState: controller.borderBottomState,
      borderStart: controller.borderStart,
      borderStartState: controller.borderStartState,
      borderEnd: controller.borderEnd,
      borderEndState: controller.borderEndState,

      /// BORDER RADIUS PROPERTIES
      borderRadius: controller.borderRadiusAll,
      borderRadiusState: controller.borderRadiusAllState,
      borderRadiusBL: controller.borderRadiusBL,
      borderRadiusBLState: controller.borderRadiusBLState,
      borderRadiusBR: controller.borderRadiusBR,
      borderRadiusBRState: controller.borderRadiusBRState,
      borderRadiusTL: controller.borderRadiusTL,
      borderRadiusTLState: controller.borderRadiusTLState,
      borderRadiusTR: controller.borderRadiusTR,
      borderRadiusTRState: controller.borderRadiusTRState,

      ///
      ///
      ///
      activated: controller.activated,
      enabled: controller.enabled,
      visibility: controller.visible,
      width: controller.width,
      height: controller.height,
      margin: controller.marginValue,
      marginHorizontal: controller.marginHorizontal,
      marginVertical: controller.marginVertical,
      marginTop: controller.marginTop,
      marginBottom: controller.marginBottom,
      marginStart: controller.marginStart,
      marginEnd: controller.marginEnd,
      shadow: controller.shadow,
      shadowBlurRadius: controller.shadowBlurRadius,
      shadowSpreadRadius: controller.shadowSpreadRadius,
      shadowHorizontal: controller.shadowHorizontal,
      shadowVertical: controller.shadowVertical,
      shadowStart: controller.shadowStart,
      shadowEnd: controller.shadowEnd,
      shadowTop: controller.shadowTop,
      shadowBottom: controller.shadowBottom,
      background: controller.background,
      foreground: controller.foreground,
      shadowColor: controller.shadowColor ?? controller.borderOverlayColor,
      gravity: controller.gravity,
      transformGravity: controller.transformGravity,
      backgroundBlendMode: controller.backgroundBlendMode,
      foregroundBlendMode: controller.foregroundBlendMode,
      backgroundImage: controller.backgroundImage,
      foregroundImage: controller.foregroundImage,
      backgroundGradient: controller.backgroundGradient,
      foregroundGradient: controller.foregroundGradient,
      transform: controller.transform,
      shadowBlurStyle: controller.shadowBlurStyle,
      clipBehavior: controller.clipBehavior,
      shadowType: controller.shadowType,
      shape: controller.shape,
      image: controller.url,
      placeholder: controller.placeholder,
      cacheMode: controller.cacheMode,
      scaleType: controller.scaleType,
    );
  }
}

class AvatarViewController extends ViewController {
  String? url;
  dynamic placeholder;
  double size = 40;
  bool? cacheMode;
  bool circular = true;
  BoxFit scaleType = BoxFit.cover;
  bool borderOverlay = true;
  Color borderOverlayColor = Colors.black.withOpacity(0.5);
  double borderOverlaySize = 0.2;

  @override
  AvatarViewController fromView(
    YMRView<ViewController> view, {
    String? url,
    dynamic placeholder,
    double? size,
    bool? cacheMode,
    bool? circular,
    BoxFit? scaleType,
    double? borderSize,
    double? borderPadding,
    bool? borderOverlay,
    Color? borderOverlayColor,
    double? borderOverlaySize,
  }) {
    super.fromView(view);
    this.url = url;
    this.placeholder = placeholder;
    this.size = size ?? 40;
    this.cacheMode = cacheMode;
    this.circular = circular ?? true;
    this.scaleType = scaleType ?? BoxFit.cover;
    this.borderSize = borderSize ?? 0;
    this.borderOverlay = borderOverlay ?? true;
    this.borderOverlayColor =
        borderOverlayColor ?? Colors.black.withOpacity(0.5);
    this.borderOverlaySize = borderOverlaySize ?? 0.2;
    return this;
  }

  @override
  double get marginStart => super.marginStart ?? overlaySize;

  @override
  double get marginEnd => super.marginEnd ?? overlaySize;

  @override
  double get marginTop => super.marginTop ?? overlaySize;

  @override
  double get marginBottom => super.marginBottom ?? overlaySize;

  @override
  double? get width => size;

  @override
  double? get height => size;

  double get overlaySize => borderOverlaySize * 3;

  @override
  Color get borderColor => super.borderColor ?? Colors.white;

  @override
  double get borderRadiusAll {
    return circular ? 0 : super.borderRadiusAll ?? size;
  }

  @override
  ViewShape get shape => circular ? ViewShape.circular : ViewShape.squire;

  @override
  Color? get shadowColor => borderOverlayColor;

  @override
  double get shadowBlurRadius => borderOverlaySize;

  @override
  ViewShadowType get shadowType =>
      borderOverlay ? ViewShadowType.overlay : ViewShadowType.none;
}
