import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

class BottomNavigationContent {
  final dynamic icon;
  final ValueState<dynamic>? iconState;
  final String? title;
  final ValueState<String>? titleState;

  const BottomNavigationContent({
    this.icon,
    this.iconState,
    this.title,
    this.titleState,
  });

  String? getIcon(bool selected) => iconState?.selected(selected) ?? icon;

  String? getTitle(bool selected) => titleState?.selected(selected) ?? title;
}

class BottomNavigationItem extends StatelessWidget {
  final bool isSelected;
  final bool isVisible;
  final dynamic icon;
  final ValueState<dynamic>? iconState;
  final double? iconSize;
  final ValueState<double>? iconSizeState;
  final Color? iconTint;
  final ValueState<Color>? iconTintState;
  final String? title;
  final ValueState<String>? titleState;
  final Color? titleColor;
  final ValueState<Color>? titleColorState;
  final double? titleSize;
  final ValueState<double>? titleSizeState;
  final double? spaceBetween;
  final ValueState<double>? spaceBetweenState;
  final Color? background;
  final ValueState<Color>? backgroundState;
  final double? maxWidth;
  final double? maxHeight;
  final double? minWidth;
  final double? minHeight;
  final double? margin;
  final double? marginX;
  final double? marginY;
  final double? padding;
  final double? paddingX;
  final double? paddingY;
  final OnViewClickListener? onClick;

  const BottomNavigationItem({
    super.key,
    this.isSelected = false,
    this.isVisible = true,
    this.icon,
    this.iconState,
    this.iconSize,
    this.iconSizeState,
    this.iconTint,
    this.iconTintState,
    this.title,
    this.titleState,
    this.titleColor,
    this.titleColorState,
    this.titleSize,
    this.titleSizeState,
    this.spaceBetween,
    this.spaceBetweenState,
    this.maxWidth,
    this.maxHeight,
    this.minWidth,
    this.minHeight,
    this.margin,
    this.marginX,
    this.marginY,
    this.padding,
    this.paddingX,
    this.paddingY,
    this.background,
    this.backgroundState,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    var ic = iconState?.activated(isSelected) ?? icon;
    var text = titleState?.activated(isSelected) ?? title ?? "";
    var spacer = spaceBetweenState?.activated(isSelected) ?? spaceBetween ?? 2;
    return LinearLayout(
      widthMax: maxWidth,
      widthMin: minWidth,
      heightMax: maxHeight,
      heightMin: minHeight,
      margin: margin,
      marginHorizontal: marginX,
      marginVertical: marginY,
      padding: padding,
      paddingHorizontal: paddingX,
      paddingVertical: paddingY,
      background: background,
      backgroundState: backgroundState,
      visibility: isVisible,
      gravity: Alignment.center,
      layoutGravity: LayoutGravity.center,
      onClick: onClick,
      children: [
        IconView(
          visibility: ic != null,
          activated: isSelected,
          icon: ic,
          iconState: iconState,
          size: iconSize,
          sizeState: iconSizeState,
          tint: iconTint,
          tintState: iconTintState,
        ),
        TextView(
          paddingHorizontal: 8,
          marginTop: spacer,
          visibility: text.isNotEmpty,
          activated: isSelected,
          text: text,
          textState: titleState,
          textSize: titleSize,
          textColor: titleColor,
          textColorState: titleColorState,
        ),
      ],
    );
  }
}

class BottomNavigationView extends YMRView<BottomNavigationViewController> {
  final int? currentIndex;
  final double? iconSize;
  final ValueState<double>? iconSizeState;
  final Color? iconTint;
  final ValueState<Color>? iconTintState;
  final Color? titleColor;
  final ValueState<Color>? titleColorState;
  final double? titleSize;
  final ValueState<double>? titleSizeState;
  final double? spaceBetween;
  final ValueState<double>? spaceBetweenState;
  final Color? itemBackground;
  final ValueState<Color>? itemBackgroundState;
  final double? itemMaxWidth;
  final double? itemMaxHeight;
  final double? itemMinWidth;
  final double? itemMinHeight;
  final double? itemMargin;
  final double? itemMarginX;
  final double? itemMarginY;
  final double? itemPadding;
  final double? itemPaddingX;
  final double? itemPaddingY;

  final List<BottomNavigationContent> items;

  const BottomNavigationView({
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
    super.ripple,
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
    this.iconSize,
    this.iconSizeState,
    this.iconTint,
    this.iconTintState,
    this.titleColor,
    this.titleColorState,
    this.titleSize,
    this.titleSizeState,
    this.spaceBetween,
    this.spaceBetweenState,
    this.itemBackground,
    this.itemBackgroundState,
    this.itemMaxWidth,
    this.itemMaxHeight,
    this.itemMinWidth,
    this.itemMinHeight,
    this.itemMargin,
    this.itemMarginX,
    this.itemMarginY,
    this.itemPadding,
    this.itemPaddingX,
    this.itemPaddingY,
    required this.items,
  });

  @override
  BottomNavigationViewController initController() {
    return BottomNavigationViewController();
  }

  @override
  BottomNavigationViewController attachController(
    BottomNavigationViewController controller,
  ) {
    return controller.fromBNView(this);
  }

  @override
  Widget? attach(
    BuildContext context,
    BottomNavigationViewController controller,
  ) {
    var length = items.length;
    var type = controller.navigationType;
    var isFixedNav = type == BottomNavigationType.fixed;

    var parent = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(length, (index) {
        var item = items[index];
        var selected = index == controller.currentIndex;
        var child = BottomNavigationItem(
          isSelected: selected,
          icon: item.icon,
          iconState: item.iconState,
          iconSize: controller.iconSize,
          iconSizeState: controller.iconSizeState,
          iconTint: controller.iconTint,
          iconTintState: controller.iconTintState,
          title: item.title,
          titleState: item.titleState,
          titleColor: controller.titleColor,
          titleColorState: controller.titleColorState,
          titleSize: controller.titleSize,
          titleSizeState: controller.titleSizeState,
          spaceBetween: controller.spaceBetween,
          spaceBetweenState: controller.spaceBetweenState,
          background: controller.background,
          backgroundState: controller.backgroundState,
          margin: controller.itemMargin,
          marginX: controller.itemMarginX,
          marginY: controller.itemMarginY,
          padding: controller.itemPadding,
          paddingX: controller.itemPaddingX,
          paddingY: controller.itemPaddingY,
          onClick: (context) => controller.onNotify(index),
        );
        if (isFixedNav) {
          return Expanded(child: child);
        } else {
          return child;
        }
      }),
    );

    switch (type) {
      case BottomNavigationType.scrollable:
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: parent,
        );
      default:
        return parent;
    }
  }
}

enum BottomNavigationType {
  fixed,
  scrollable;
}

class BottomNavigationViewController extends ViewController {
  int currentIndex = 0;
  double? iconSize;
  ValueState<double>? iconSizeState;
  Color? iconTint;
  ValueState<Color>? iconTintState;
  Color? titleColor;
  ValueState<Color>? titleColorState;
  double? titleSize;
  ValueState<double>? titleSizeState;
  List<BottomNavigationContent> items = [];
  double spaceBetween = 2;
  ValueState<double>? spaceBetweenState;

  Color? itemBackground;
  ValueState<Color>? itemBackgroundState;
  double? itemMaxWidth;
  double? itemMaxHeight;
  double itemMinWidth = 80;
  double? itemMinHeight;
  double? itemMargin;
  double? itemMarginX;
  double? itemMarginY;
  double? itemPadding;
  double? itemPaddingX;
  double? itemPaddingY;

  int get length => items.length;

  BottomNavigationType get navigationType {
    if (length > 4) {
      return BottomNavigationType.scrollable;
    } else {
      return BottomNavigationType.fixed;
    }
  }

  BottomNavigationViewController fromBNView(BottomNavigationView view) {
    super.fromView(view);
    currentIndex = view.currentIndex ?? 0;
    iconSize = view.iconSize;
    iconSizeState = view.iconSizeState;
    iconTint = view.iconTint;
    iconTintState = view.iconTintState;
    titleColor = view.titleColor;
    titleColorState = view.titleColorState;
    titleSize = view.titleSize;
    titleSizeState = view.titleSizeState;
    spaceBetween = view.spaceBetween ?? 2;
    spaceBetweenState = view.spaceBetweenState;
    itemBackground = view.itemBackground;
    itemBackgroundState = view.itemBackgroundState;
    itemMaxWidth = view.itemMaxWidth;
    itemMaxHeight = view.itemMaxHeight;
    itemMinWidth = view.itemMinWidth ?? 80;
    itemMinHeight = view.itemMinHeight;
    itemMargin = view.itemMargin;
    itemMarginX = view.itemMarginX;
    itemMarginY = view.itemMarginY;
    itemPadding = view.itemPadding;
    itemPaddingX = view.itemPaddingX;
    itemPaddingY = view.itemPaddingY;
    items = view.items;
    return this;
  }

  @override
  void onNotify([int index = 0]) {
    if (currentIndex != index) {
      currentIndex = index;
      super.onNotify();
    }
  }
}
