part of '../widgets.dart';

typedef OnPageChangeListener = void Function(int index);

class ViewPager extends YMRView<ViewPagerController> {
  final OnPageChangeListener? onPageChange;
  final List<Widget> items;

  const ViewPager({
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
    super.ripple,
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
    this.items = const [],
    this.onPageChange,
  });

  @override
  ViewPagerController initController() => ViewPagerController();

  @override
  ViewPagerController attachController(ViewPagerController controller) {
    return controller.fromView(
      this,
      items: items,
      onPageChange: onPageChange,
    );
  }

  @override
  Widget? attach(BuildContext context, ViewPagerController controller) {
    return PageView.builder(
      scrollDirection: controller.orientation,
      onPageChanged: controller.onPageChange,
      controller: controller.pager,
      itemCount: controller.size,
      itemBuilder: (context, index) {
        return controller.items[index];
      },
    );
  }
}

class ViewPagerController extends ViewController {
  int index = 0;
  Axis orientation = Axis.horizontal;
  List<Widget> items = [];
  late PageController pager;
  late TabController tab;
  OnPageChangeListener? onPageChange;

  ViewPagerController() {
    pager = PageController(initialPage: 0);
  }

  @override
  ViewPagerController fromView(
    YMRView<ViewController> view, {
    List<Widget>? items,
    OnPageChangeListener? onPageChange,
  }) {
    super.fromView(view);
    this.items = items ?? [];
    this.onPageChange = onPageChange;
    return this;
  }

  int get size => items.length;

  void setOnPageChangeListener(OnPageChangeListener listener) {
    onPageChange = listener;
  }
}
