import 'package:flutter/material.dart';

import '../view/view.dart';

part 'controller.dart';

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
