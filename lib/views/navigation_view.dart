part of '../widgets.dart';

typedef NavigationViewBuilder = Widget Function(BuildContext, int);
typedef OnNavigationIndexChangeListener = void Function(int index);

enum NavigationType {
  fixed,
  scrollable;
}

class NavigationItem extends StatelessWidget {
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

  const NavigationItem({
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
    var ic = iconState?.detect(isSelected) ?? icon;
    var text = titleState?.detect(isSelected) ?? title ?? "";
    var spacer = spaceBetweenState?.detect(isSelected) ?? spaceBetween ?? 2;
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

class NavigationView extends YMRView<NavigationViewController> {
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

  final List<NavigationItem> items;
  final NavigationViewBuilder builder;
  final OnNavigationIndexChangeListener? onIndexChanged;

  const NavigationView({
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
    required this.builder,
    this.onIndexChanged,
  });

  @override
  ViewRoots initRootProperties() => const ViewRoots(position: false);

  @override
  NavigationViewController initController() => NavigationViewController();

  @override
  NavigationViewController attachController(
    NavigationViewController controller,
  ) {
    return controller.fromNavigationView(this);
  }

  @override
  Widget root(
    BuildContext context,
    NavigationViewController controller,
    Widget parent,
  ) {
    var isMargin = controller.marginAll > 0;
    var type = controller.positionType;

    if (isMargin) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Expanded(child: builder(context, controller.currentIndex)),
          Positioned(
            left: type.position.left,
            right: type.position.right,
            top: type.position.top,
            bottom: type.position.bottom,
            child: parent,
          ),
        ],
      );
    } else {
      if (controller.positionType.isYMode) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (controller.positionType.isTopMode) parent,
            Expanded(child: builder(context, controller.currentIndex)),
            if (controller.positionType.isBottomMode) parent,
          ],
        );
      } else {
        return Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (controller.positionType.isLeftMode) parent,
            Expanded(child: builder(context, controller.currentIndex)),
            if (controller.positionType.isRightMode) parent,
          ],
        );
      }
    }
  }

  @override
  Widget? attach(
    BuildContext context,
    NavigationViewController controller,
  ) {
    var child = Flex(
      direction: controller.navDirection,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: controller.navCrossDirection,
      mainAxisAlignment: controller.navMainDirection,
      children: List.generate(controller.length, (index) {
        var item = controller.items[index];
        var selected = index == controller.currentIndex;
        var child = NavigationItem(
          key: item.key,
          isSelected: item.isSelected ? true : selected,
          isVisible: item.isVisible,
          icon: item.icon,
          iconState: item.iconState,
          iconSize: item.iconSize ?? controller.iconSize,
          iconSizeState: item.iconSizeState ?? controller.iconSizeState,
          iconTint: item.iconTint ?? controller.iconTint,
          iconTintState: item.iconTintState ?? controller.iconTintState,
          title: item.title,
          titleState: item.titleState,
          titleColor: item.titleColor ?? controller.titleColor,
          titleColorState: item.titleColorState ?? controller.titleColorState,
          titleSize: item.titleSize ?? controller.titleSize,
          titleSizeState: item.titleSizeState ?? controller.titleSizeState,
          background: item.background ?? controller.background,
          backgroundState: item.backgroundState ?? controller.backgroundState,
          maxWidth: item.maxWidth ?? controller.itemMaxWidth,
          minWidth: item.minWidth ?? controller.itemMinWidth,
          maxHeight: item.maxHeight ?? controller.itemMaxHeight,
          minHeight: item.minHeight ?? controller.itemMinHeight,
          margin: item.margin ?? controller.itemMargin,
          marginX: item.marginX ?? controller.itemMarginX,
          marginY: item.marginY ?? controller.itemMarginY,
          padding: item.padding ?? controller.itemPadding,
          paddingX: item.paddingX ?? controller.itemPaddingX,
          paddingY: item.paddingY ?? controller.itemPaddingY,
          spaceBetween: item.spaceBetween ?? controller.spaceBetween,
          spaceBetweenState:
              item.spaceBetweenState ?? controller.spaceBetweenState,
          onClick: (context) {
            if (item.onClick != null) item.onClick?.call(context);
            controller.onNotify(index);
          },
        );
        if (controller.navigationType == NavigationType.fixed) {
          return Expanded(child: child);
        } else {
          return child;
        }
      }),
    );
    switch (controller.navigationType) {
      case NavigationType.scrollable:
        return SingleChildScrollView(
          scrollDirection: controller.navDirection,
          child: child,
        );
      default:
        return child;
    }
  }
}

class NavigationViewController extends ViewController {
  int currentIndex = 0;
  double iconSize = 24;
  ValueState<double>? iconSizeState;
  Color? iconTint;
  ValueState<Color>? iconTintState;
  Color? titleColor;
  ValueState<Color>? titleColorState;
  double titleSize = 12;
  ValueState<double>? titleSizeState;
  List<NavigationItem> items = [];
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

  OnNavigationIndexChangeListener? onIndexChanged;

  int get length => items.length;

  Axis get navDirection {
    return positionType.isYMode ? Axis.horizontal : Axis.vertical;
  }

  MainAxisAlignment get navMainDirection {
    switch (positionType) {
      case ViewPositionType.center:
      case ViewPositionType.centerFlexX:
      case ViewPositionType.centerFlexY:
      case ViewPositionType.centerFill:
        return MainAxisAlignment.center;
      case ViewPositionType.left:
      case ViewPositionType.leftFlex:
        return MainAxisAlignment.spaceAround;
      case ViewPositionType.leftTop:
        return MainAxisAlignment.start;
      case ViewPositionType.leftBottom:
        return MainAxisAlignment.end;
      case ViewPositionType.right:
      case ViewPositionType.rightFlex:
        return MainAxisAlignment.spaceAround;
      case ViewPositionType.rightTop:
        return MainAxisAlignment.start;
      case ViewPositionType.rightBottom:
        return MainAxisAlignment.end;
      case ViewPositionType.top:
      case ViewPositionType.topFlex:
        return MainAxisAlignment.spaceAround;
      case ViewPositionType.topLeft:
        return MainAxisAlignment.start;
      case ViewPositionType.topRight:
        return MainAxisAlignment.end;
      case ViewPositionType.bottom:
      case ViewPositionType.bottomFlex:
        return MainAxisAlignment.spaceAround;
      case ViewPositionType.bottomLeft:
        return MainAxisAlignment.start;
      case ViewPositionType.bottomRight:
        return MainAxisAlignment.end;
    }
  }

  CrossAxisAlignment get navCrossDirection {
    switch (positionType) {
      case ViewPositionType.center:
      case ViewPositionType.centerFlexX:
      case ViewPositionType.centerFlexY:
      case ViewPositionType.centerFill:
        return CrossAxisAlignment.center;
      case ViewPositionType.left:
      case ViewPositionType.leftFlex:
        return CrossAxisAlignment.center;
      case ViewPositionType.leftTop:
        return CrossAxisAlignment.start;
      case ViewPositionType.leftBottom:
        return CrossAxisAlignment.end;
      case ViewPositionType.right:
      case ViewPositionType.rightFlex:
        return CrossAxisAlignment.center;
      case ViewPositionType.rightTop:
        return CrossAxisAlignment.start;
      case ViewPositionType.rightBottom:
        return CrossAxisAlignment.end;
      case ViewPositionType.top:
      case ViewPositionType.topFlex:
        return CrossAxisAlignment.center;
      case ViewPositionType.topLeft:
        return CrossAxisAlignment.start;
      case ViewPositionType.topRight:
        return CrossAxisAlignment.end;
      case ViewPositionType.bottom:
      case ViewPositionType.bottomFlex:
        return CrossAxisAlignment.center;
      case ViewPositionType.bottomLeft:
        return CrossAxisAlignment.start;
      case ViewPositionType.bottomRight:
        return CrossAxisAlignment.end;
    }
  }

  NavigationType get navigationType {
    if (length < 5) {
      return NavigationType.fixed;
    } else {
      return NavigationType.scrollable;
    }
  }

  NavigationViewController fromNavigationView(NavigationView view) {
    super.fromView(view);
    currentIndex = view.currentIndex ?? 0;
    iconSize = view.iconSize ?? 24;
    iconSizeState = view.iconSizeState;
    iconTint = view.iconTint;
    iconTintState = view.iconTintState;
    titleColor = view.titleColor;
    titleColorState = view.titleColorState;
    titleSize = view.titleSize ?? 12;
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
    onIndexChanged = view.onIndexChanged;
    return this;
  }

  NavigationItem getItem(int index) => items[index];

  @override
  void onNotify([int index = 0]) {
    super.onNotifyWithCallback(() {
      if (currentIndex != index) {
        currentIndex = index;
        if (onIndexChanged != null) onIndexChanged?.call(currentIndex);
      }
    });
  }
}
