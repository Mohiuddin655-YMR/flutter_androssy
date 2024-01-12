import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_svg/svg.dart';

import '../view/view.dart';

part 'controller.dart';
part 'raw.dart';
part 'type.dart';

class IconView<T extends IconViewController> extends YMRView<T> {
  final BoxFit fit;
  final dynamic icon;
  final ValueState<dynamic>? iconState;
  final double? size;
  final ValueState<double>? sizeState;
  final Color? tint;
  final ValueState<Color>? tintState;
  final BlendMode tintMode;
  final bool iconSizeAsFixed;
  final IconThemeData? iconTheme;
  final ValueState<IconThemeData>? iconThemeState;

  const IconView({
    /// ROOT PROPERTIES
    super.key,
    super.controller,

    /// CALLBACK PROPERTIES
    super.onActivator,
    super.onChange,
    super.onError,
    super.onHover,
    super.onValid,
    super.onValidator,

    /// CLICK PROPERTIES
    super.clickEffect,
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onToggleClick,
    super.onClickHandler,
    super.onDoubleClickHandler,
    super.onLongClickHandler,

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

    /// BACKDROP PROPERTIES
    super.backdropFilter,
    super.backdropMode,

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

    /// INDICATOR PROPERTIES
    super.indicatorVisible,

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

    /// CHILD PROPERTIES
    this.icon,
    this.fit = BoxFit.contain,
    this.iconState,
    this.size,
    this.sizeState,
    this.tint,
    this.tintState,
    this.tintMode = BlendMode.srcIn,
    this.iconSizeAsFixed = false,
    this.iconTheme,
    this.iconThemeState,
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
