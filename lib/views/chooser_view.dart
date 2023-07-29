part of '../widgets.dart';

class ChooserView<T> extends YMRView<ChooserViewController> {
  final int? currentIndex;
  final WrapAlignment? itemAlignment;
  final Clip? itemClipBehavior;
  final WrapCrossAlignment? itemCrossAlignment;
  final WrapAlignment? itemFlowAlignment;
  final Axis? itemDirection;
  final TextDirection? itemTextDirection;
  final VerticalDirection? itemVerticalDirection;
  final double? itemRunSpace;
  final double? itemSpace;

  final List<T> items;
  final Widget Function(BuildContext, int current, int selected) builder;

  const ChooserView({
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
    super.clipBehavior,
    super.controller,
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
    super.scrollable,
    super.scrollController,
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
    this.currentIndex,
    this.itemAlignment,
    this.itemClipBehavior,
    this.itemCrossAlignment,
    this.itemDirection,
    this.itemFlowAlignment,
    this.itemTextDirection,
    this.itemVerticalDirection,
    this.itemRunSpace,
    this.itemSpace,
    required this.items,
    required this.builder,
  });

  @override
  ChooserViewController initController() => ChooserViewController();

  @override
  ChooserViewController attachController(ChooserViewController controller) {
    return controller.fromChooserView(this);
  }

  @override
  Widget? attach(BuildContext context, ChooserViewController controller) {
    return Wrap(
      alignment: controller.itemAlignment,
      clipBehavior: controller.itemClipBehavior,
      crossAxisAlignment: controller.itemCrossAlignment,
      direction: controller.itemDirection,
      runAlignment: controller.itemFlowAlignment,
      runSpacing: controller.itemRunSpace,
      spacing: controller.itemSpace,
      textDirection: controller.itemTextDirection,
      verticalDirection: controller.itemVerticalDirection,
      children: List.generate(items.length, (index) {
        return GestureDetector(
          onTap: () => controller.onNotify(index),
          child: AbsorbPointer(
            child: builder(context, index, controller.currentIndex),
          ),
        );
      }),
    );
  }
}

class ChooserViewController extends ViewController {
  int currentIndex = 0;
  WrapAlignment itemAlignment = WrapAlignment.start;
  Clip itemClipBehavior = Clip.none;
  WrapCrossAlignment itemCrossAlignment = WrapCrossAlignment.start;
  Axis itemDirection = Axis.horizontal;
  WrapAlignment itemFlowAlignment = WrapAlignment.start;
  TextDirection? itemTextDirection;
  VerticalDirection itemVerticalDirection = VerticalDirection.down;
  double itemRunSpace = 12;
  double itemSpace = 8;

  ChooserViewController fromChooserView(ChooserView view) {
    super.fromView(view);
    currentIndex = view.currentIndex ?? 0;
    itemAlignment = view.itemAlignment ?? WrapAlignment.start;
    itemClipBehavior = view.itemClipBehavior ?? Clip.none;
    itemCrossAlignment = view.itemCrossAlignment ?? WrapCrossAlignment.start;
    itemDirection = view.itemDirection ?? Axis.horizontal;
    itemFlowAlignment = view.itemFlowAlignment ?? WrapAlignment.start;
    itemTextDirection = view.itemTextDirection;
    itemVerticalDirection =
        view.itemVerticalDirection ?? VerticalDirection.down;
    itemRunSpace = view.itemRunSpace ?? 12;
    itemSpace = view.itemSpace ?? 8;
    return this;
  }

  @override
  Axis get orientation {
    return itemDirection == Axis.vertical ? Axis.horizontal : Axis.vertical;
  }

  @override
  void onNotify([int index = 0]) {
    if (currentIndex != index) {
      currentIndex = index;
      super.onNotify();
    }
  }
}
