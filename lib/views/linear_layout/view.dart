import 'package:flutter/material.dart';

import '../view/view.dart';

part 'controller.dart';
part 'extensions.dart';
part 'gravity.dart';
part 'typedefs.dart';

class LinearLayout<T extends LinearLayoutController> extends YMRView<T> {
  final LayoutGravity? layoutGravity;
  final CrossAxisAlignment? crossGravity;
  final MainAxisAlignment? mainGravity;
  final MainAxisSize mainAxisSize;
  final TextBaseline? textBaseline;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final OnViewChangeListener? onPaging;

  final List<Widget>? children;

  const LinearLayout({
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
    super.onValid,

    /// CHILD PROPERTIES
    this.layoutGravity,
    this.mainGravity,
    this.mainAxisSize = MainAxisSize.min,
    this.crossGravity,
    this.textBaseline,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.onPaging,
    this.children,
  });

  @override
  T initController() => LinearLayoutController() as T;

  @override
  T attachController(T controller) => controller.fromLinearLayout(this) as T;

  @override
  Widget? attach(BuildContext context, T controller) {
    return controller.orientation == Axis.vertical
        ? Column(
            mainAxisAlignment: controller.mainGravity,
            mainAxisSize: controller.mainAxisSize,
            crossAxisAlignment: controller.crossGravity,
            textBaseline: controller.textBaseline,
            textDirection: controller.textDirection,
            verticalDirection: controller.verticalDirection,
            children: controller.children,
          )
        : Row(
            mainAxisAlignment: controller.mainGravity,
            mainAxisSize: controller.mainAxisSize,
            crossAxisAlignment: controller.crossGravity,
            textBaseline: controller.textBaseline,
            textDirection: controller.textDirection,
            verticalDirection: controller.verticalDirection,
            children: controller.children,
          );
  }
}