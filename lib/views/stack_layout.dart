part of '../widgets.dart';

class StackLayout extends YMRView<StackLayoutController> {
  final Alignment? layoutGravity;

  final List<Widget>? children;

  const StackLayout({
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
    super.child,
    super.clipBehavior,
    super.controller,
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
    this.layoutGravity,
    this.children,
  });

  @override
  StackLayoutController initController() {
    return StackLayoutController();
  }

  @override
  StackLayoutController attachController(StackLayoutController controller) {
    return controller.fromView(
      this,
      layoutGravity: layoutGravity,
      children: children,
    );
  }

  @override
  Widget? attach(BuildContext context, StackLayoutController controller) {
    return Stack(
      alignment: controller.layoutGravity,
      children: controller.children,
    );
  }
}

class StackLayoutController extends ViewController {
  Alignment layoutGravity = Alignment.center;
  List<Widget> children = [];

  @override
  StackLayoutController fromView(
    YMRView<ViewController> view, {
    Alignment? layoutGravity,
    List<Widget>? children,
  }) {
    super.fromView(view);
    this.layoutGravity = layoutGravity ?? Alignment.center;
    this.children = children ?? [];
    return this;
  }
}
