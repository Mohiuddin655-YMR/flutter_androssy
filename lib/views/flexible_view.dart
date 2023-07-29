part of '../widgets.dart';

enum FlexPosition {
  centerX(left: 0, right: 0),
  centerY(top: 0, bottom: 0),
  start(left: 0, top: 0, bottom: 0),
  end(right: 0, top: 0, bottom: 0),
  above(top: 0, left: 0, right: 0),
  down(bottom: 0, left: 0, right: 0);

  final double? top, bottom, left, right;

  const FlexPosition({
    this.top,
    this.bottom,
    this.left,
    this.right,
  });
}

enum FlexVisibleType { front, back }

class FlexibleView extends YMRView<FlexibleViewController> {
  final Widget? flexible;
  final FlexPosition flexPosition;
  final FlexVisibleType type;

  const FlexibleView({
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
    return StackLayout(
      layoutGravity: Alignment.center,
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

class FlexibleViewController extends ViewController {
  Widget flexible = const SizedBox();
  FlexPosition flexPosition = FlexPosition.start;
  FlexVisibleType visibleType = FlexVisibleType.front;

  @override
  Widget get child => super.child ?? const SizedBox();

  bool get isBack => visibleType == FlexVisibleType.back;

  bool get isFront => visibleType == FlexVisibleType.front;

  @override
  FlexibleViewController fromView(
    YMRView<ViewController> view, {
    Widget? flexible,
    FlexPosition? flexPosition,
    FlexVisibleType? visibleType,
  }) {
    super.fromView(view);
    this.flexible = flexible ?? const SizedBox();
    this.flexPosition = flexPosition ?? FlexPosition.start;
    this.visibleType = visibleType ?? FlexVisibleType.front;
    return this;
  }
}
