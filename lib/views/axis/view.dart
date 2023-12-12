import 'package:flutter/material.dart';

import '../view/view.dart';

part 'controller.dart';

class AxisView<T extends AxisViewController> extends YMRView<T> {
  final double x, y;

  const AxisView({
    /// ROOT PROPERTIES
    super.key,
    super.controller,
    super.child,

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

    /// CHILD PROPERTIES
    this.x = 0,
    this.y = 0,
  });

  @override
  T initController() => AxisViewController() as T;

  @override
  T attachController(T controller) => controller.fromAxisView(this) as T;

  @override
  Widget? attach(
    BuildContext context,
    ViewController controller,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isPositiveX = x > 0;
        bool isPositiveY = y > 0;
        double mX = constraints.maxWidth * (x / 50);
        double mY = constraints.maxHeight * (y / 50);
        return Padding(
          padding: EdgeInsets.only(
            left: isPositiveX ? mX : 0,
            right: !isPositiveX ? mX * -1 : 0,
            top: !isPositiveY ? mY * -1 : 0,
            bottom: isPositiveY ? mY : 0,
          ),
          child: controller.child,
        );
      },
    );
  }
}