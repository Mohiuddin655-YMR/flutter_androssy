import 'package:flutter/material.dart';

import '../view/view.dart';

part 'controller.dart';
part 'flex_position.dart';
part 'flex_visible_type.dart';

class FlexibleView extends YMRView<FlexibleViewController> {
  final Widget? flexible;
  final FlexPosition flexPosition;
  final FlexVisibleType type;

  const FlexibleView({
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
    this.flexible,
    this.flexPosition = FlexPosition.start,
    this.type = FlexVisibleType.front,
  });

  @override
  FlexibleViewController initController() {
    return FlexibleViewController();
  }

  @override
  FlexibleViewController attachController(FlexibleViewController controller) {
    return controller.fromView(
      this,
      flexible: flexible,
      flexPosition: flexPosition,
      visibleType: type,
    );
  }

  @override
  Widget? attach(BuildContext context, FlexibleViewController controller) {
    return Stack(
      alignment: Alignment.center,
      children: [
        controller.isBack
            ? Positioned(
                left: controller.flexPosition.left,
                right: controller.flexPosition.right,
                top: controller.flexPosition.top,
                bottom: controller.flexPosition.bottom,
                child: controller.flexible,
              )
            : controller.child,
        controller.isFront
            ? Positioned(
                left: controller.flexPosition.left,
                right: controller.flexPosition.right,
                top: controller.flexPosition.top,
                bottom: controller.flexPosition.bottom,
                child: controller.flexible,
              )
            : controller.child,
      ],
    );
  }
}
