part of '../widgets.dart';

class ChooserView<T> extends YMRView<ChooserViewController<T>> {
  final int currentIndex;
  final WrapAlignment itemAlignment;
  final Clip itemClipBehavior;
  final WrapCrossAlignment itemCrossAlignment;
  final WrapAlignment itemFlowAlignment;
  final Axis itemDirection;
  final TextDirection itemTextDirection;
  final VerticalDirection itemVerticalDirection;
  final double itemRunSpace;
  final double itemSpace;

  final List<T> items;
  final OnViewItemClickListener<T>? onItemClick;
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
    this.currentIndex = 0,
    this.itemAlignment = WrapAlignment.start,
    this.itemClipBehavior = Clip.none,
    this.itemCrossAlignment = WrapCrossAlignment.start,
    this.itemDirection = Axis.horizontal,
    this.itemFlowAlignment = WrapAlignment.start,
    this.itemTextDirection = TextDirection.ltr,
    this.itemVerticalDirection = VerticalDirection.down,
    this.itemRunSpace = 12,
    this.itemSpace = 8,
    this.onItemClick,
    required this.items,
    required this.builder,
  });

  @override
  ChooserViewController<T> initController() => ChooserViewController<T>();

  @override
  ChooserViewController<T> attachController(
    ChooserViewController<T> controller,
  ) {
    return controller.fromChooserView(this);
  }

  @override
  Widget? attach(BuildContext context, ChooserViewController<T> controller) {
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
      children: List.generate(controller.size, (index) {
        return GestureDetector(
          onTap: () {
            if (onItemClick != null) {
              controller.onNotifyWithCallback(
                () => onItemClick!(context, controller.currentItem),
                index,
              );
            } else {
              controller.onNotify(index);
            }
          },
          child: AbsorbPointer(
            child: builder(context, index, controller.currentIndex),
          ),
        );
      }),
    );
  }
}

class ChooserViewController<T> extends ViewController {
  ChooserViewController<T> fromChooserView(ChooserView<T> view) {
    super.fromView(view);
    currentIndex = view.currentIndex;
    items = view.items;
    itemAlignment = view.itemAlignment;
    itemClipBehavior = view.itemClipBehavior;
    itemCrossAlignment = view.itemCrossAlignment;
    itemDirection = view.itemDirection;
    itemFlowAlignment = view.itemFlowAlignment;
    itemTextDirection = view.itemTextDirection;
    itemVerticalDirection = view.itemVerticalDirection;
    itemRunSpace = view.itemRunSpace;
    itemSpace = view.itemSpace;
    return this;
  }

  /// CUSTOMIZATIONS

  int get size => items.length;

  int get _i {
    if (currentIndex < 0) {
      return 0;
    }
    if (currentIndex > size) {
      return size - 1;
    }
    return currentIndex;
  }

  T get currentItem => items[_i];

  /// BASE PROPERTIES
  int currentIndex = 0;
  List<T> items = [];
  WrapAlignment itemAlignment = WrapAlignment.start;
  Clip itemClipBehavior = Clip.none;
  WrapCrossAlignment itemCrossAlignment = WrapCrossAlignment.start;
  Axis itemDirection = Axis.horizontal;
  WrapAlignment itemFlowAlignment = WrapAlignment.start;
  TextDirection? itemTextDirection;
  VerticalDirection itemVerticalDirection = VerticalDirection.down;
  double itemRunSpace = 12;
  double itemSpace = 8;

  /// SUPER PROPERTIES
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

  @override
  void onNotifyWithCallback(VoidCallback callback, [int index = 0]) {
    if (currentIndex != index) {
      currentIndex = index;
      super.onNotifyWithCallback(callback);
    }
  }
}
