part of '../widgets.dart';

enum ScrollingType {
  always(physics: AlwaysScrollableScrollPhysics()),
  bouncing(physics: BouncingScrollPhysics()),
  clamping(physics: ClampingScrollPhysics()),
  fixed(physics: FixedExtentScrollPhysics()),
  never(physics: NeverScrollableScrollPhysics()),
  page(physics: PageScrollPhysics()),
  range(physics: RangeMaintainingScrollPhysics()),
  none;

  final ScrollPhysics? physics;

  const ScrollingType({this.physics});
}

class ExpensiveScrollView extends YMRView<ExpensiveScrollViewController> {
  const ExpensiveScrollView({
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
    super.orientation,
    super.scrollable,
    super.scrollingType,
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
  });

  @override
  ExpensiveScrollViewController initController() {
    return ExpensiveScrollViewController();
  }

  @override
  ExpensiveScrollViewController attachController(
      ExpensiveScrollViewController controller) {
    return controller.fromView(this);
  }

  @override
  Widget build(
    BuildContext context,
    ExpensiveScrollViewController controller,
    Widget parent,
  ) {
    return SingleChildScrollView(
      physics: controller.scrollingType.physics,
      scrollDirection: controller.orientation,
      child: parent,
    );
  }
}

class ExpensiveScrollViewController extends ViewController {
  @override
  ExpensiveScrollViewController fromView(
    YMRView<ViewController> view,
  ) {
    super.fromView(view);
    return this;
  }
}
