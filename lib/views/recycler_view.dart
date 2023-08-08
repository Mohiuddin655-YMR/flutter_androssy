part of '../widgets.dart';

typedef RecyclerViewItemBuilder<T> = Widget Function(int index, T item);

class RecyclerView<T> extends YMRView<RecyclerViewController<T>> {
  final List<T> items;
  final int? itemCount;
  final int snapCount;

  final double spaceBetween;
  final RecyclerLayoutType layoutType;
  final RecyclerViewItemBuilder<T> builder;
  final OnViewChangeListener? onPagingListener;

  const RecyclerView({
    super.key,
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
    super.enabled,
    super.elevation,
    super.foreground,
    super.foregroundBlendMode,
    super.foregroundGradient,
    super.foregroundImage,
    super.flex,
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
    super.orientation,
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,
    super.position,
    super.positionType,
    super.scrollable,
    super.scrollingType,
    super.scrollController,
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
    super.wrapper,
    super.visibility,
    required this.items,
    required this.builder,
    this.itemCount,
    this.snapCount = 1,
    this.spaceBetween = 0,
    this.layoutType = RecyclerLayoutType.linear,
    this.onPagingListener,
  });

  @override
  void onDispose(RecyclerViewController<T> controller) => controller._dispose();

  @override
  ViewRoots initRootProperties() => const ViewRoots(wrapper: false);

  @override
  RecyclerViewController<T> initController() => RecyclerViewController();

  @override
  RecyclerViewController<T> attachController(
    RecyclerViewController<T> controller,
  ) {
    return controller.fromRecyclerView(this);
  }

  @override
  Widget? attach(BuildContext context, RecyclerViewController<T> controller) {
    return controller.isValidItemCountingOrSnapping
        ? Flex(
            direction: controller.orientation,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: controller.isGridMode
                ? List.generate(controller.rowCount, (row) {
                    final startIndex = controller.startIndex(row);
                    final endIndex = controller.endIndex(startIndex);
                    return WrapperView(
                      wrapper: controller.wrapper,
                      child: Flex(
                        direction: controller._orientationAsInverse,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(controller.snapCount, (column) {
                          final itemIndex = startIndex + column;
                          final item = controller.getItem(itemIndex);
                          final isBuildMode = itemIndex < endIndex;

                          Widget child;

                          if (isBuildMode && item != null) {
                            child = builder(itemIndex, item);
                          } else {
                            child = const SizedBox();
                          }

                          if (controller.isVerticalMode) {
                            child = Expanded(child: child);
                          }

                          return child;
                        }),
                      ),
                    );
                  })
                : List.generate(controller.itemCount, (index) {
                    var item = controller.items[index];
                    var child = builder(index, item);
                    if (controller.isSpacer &&
                        controller.itemCount - 1 != index) {
                      return Flex(
                        direction: controller.orientation,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          child,
                          SizedBox(
                            width: controller.isVerticalMode
                                ? null
                                : controller.spaceBetween,
                            height: controller.isVerticalMode
                                ? controller.spaceBetween
                                : null,
                          ),
                        ],
                      );
                    } else {
                      return child;
                    }
                  }),
          )
        : null;
  }
}

class RecyclerViewController<T> extends ViewController {
  /// BASE PROPERTIES
  List<T> items = [];
  int? _itemCount;
  int snapCount = 1;

  double spaceBetween = 0;
  RecyclerLayoutType layoutType = RecyclerLayoutType.linear;
  OnViewChangeListener? onPagingListener;

  /// ROOT START
  set itemCount(int? value) => _itemCount = value;

  int get itemCount => _itemCount ?? items.length;

  int get rowCount => (itemCount / snapCount).ceil();

  int startIndex(int rowIndex) => rowIndex * snapCount;

  int endIndex(int startIndex) {
    var si = startIndex + snapCount;
    return si < itemCount ? si : itemCount;
  }

  ///END
  RecyclerViewController<T> fromRecyclerView(RecyclerView<T> view) {
    super.fromView(view);

    /// BASE PROPERTIES
    items = view.items;
    itemCount = view.itemCount;
    snapCount = view.snapCount;
    layoutType = view.layoutType;
    spaceBetween = view.spaceBetween;
    onPagingListener = view.onPagingListener;

    return this;
  }

  bool get isGridMode => layoutType == RecyclerLayoutType.grid || snapCount > 1;

  bool get isValidItemCountingOrSnapping => itemCount > 0 && snapCount > 0;

  bool get isVerticalMode => orientation == Axis.vertical;

  bool get isSpacer => spaceBetween > 0;

  /// Items properties
  T get firstItem => items.first;

  T get lastItem => items.last;

  int get size => items.length;

  T? getItem(int index) => size > 0 && size > index ? items[index] : null;

  void setItem(T item, [int? index]) {
    super.onNotifyWithCallback(() {
      var list = List<T>.from(items);
      if (index != null && itemCount >= index) {
        list.insert(index, item);
      } else {
        list.add(item);
      }
      items = list;
    });
  }

  void setItemAsFirst(T item) => setItem(item, 0);

  void setItemAsMiddle(T item) => setItem(item, itemCount ~/ 2);

  void setItemAsLast(T item) => setItem(item, itemCount);

  void setItems(List<T> items, [bool insertable = true]) {
    super.onNotifyWithCallback(() {
      if (insertable) {
        var list = List<T>.from(this.items);
        list.addAll(items);
        this.items = list;
      } else {
        this.items = items;
      }
    });
  }

  void setItemsAt(List<T> items, int index) {
    super.onNotifyWithCallback(() {
      var list = List<T>.from(this.items);
      if (itemCount >= index) {
        list.insertAll(index, items);
      } else {
        list.addAll(items);
      }
      this.items = list;
    });
  }

  void setItemsAsFirst(List<T> items) => setItemsAt(items, 0);

  void setItemsAsMiddle(List<T> items) => setItemsAt(items, itemCount ~/ 2);

  void setItemsAsLast(List<T> items) => setItemsAt(items, itemCount);

  void setItemCount(int value) {
    super.onNotifyWithCallback(() {
      _itemCount = value;
    });
  }

  void removeItem(T item) {
    super.onNotifyWithCallback(() {
      var list = List<T>.from(items);
      list.remove(item);
      items = list;
    });
  }

  void removeItemAt(int index) {
    super.onNotifyWithCallback(() {
      if (index >= 0 && index < itemCount) {
        var list = List<T>.from(items);
        list.removeAt(index);
        items = list;
      }
    });
  }

  Axis get _orientationAsInverse =>
      isVerticalMode ? Axis.horizontal : Axis.vertical;

  void setSnapCount(int value) {
    super.onNotifyWithCallback(() {
      snapCount = value;
    });
  }

  /// SUPER PROPERTIES

  @override
  ScrollController get scrollController {
    if (onPagingListener != null) {
      return scrollController;
      // return super
      //     .scrollController
      //     .paging(onListen: onPagingListener ?? (v) {});
    } else {
      return super.scrollController;
    }
  }

  ScrollController paging({required VoidCallback callback}) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          callback.call();
        }
      }
    });
    return scrollController;
  }

  void setRecyclerType(RecyclerLayoutType value) {
    super.onNotifyWithCallback(() => layoutType = value);
  }

  void setSpaceBetween(double value) {
    super.onNotifyWithCallback(() => spaceBetween = value);
  }

  void _dispose() => scrollController.dispose();
}

enum RecyclerLayoutType { linear, grid }
