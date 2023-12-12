import 'package:flutter/material.dart';

import '../view/view.dart';

typedef OnPageChangeListener = void Function(int index);

class ViewPager extends YMRView<ViewPagerController> {
  final OnPageChangeListener? onPageChange;
  final List<Widget> items;

  const ViewPager({
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
