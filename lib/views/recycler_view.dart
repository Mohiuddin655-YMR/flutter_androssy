part of '../widgets.dart';

typedef RecyclerViewItemBuilder<T> = Widget Function(int index, T item);

class _RVGItem<T> {
  final T? data;
  final bool temporary;

  const _RVGItem(
    this.data, [
    this.temporary = false,
  ]);

  const _RVGItem.temp([T? value])
      : data = value,
        temporary = true;
}

class RecyclerViewController<T> extends ViewController {
  List<T> items = [];
  int? _itemCount;
  double spaceBetween = 0;
  RecyclerLayoutType layoutType = RecyclerLayoutType.linear;
  OnViewChangeListener? onPagingListener;

  RecyclerViewController<T> fromRecyclerView(RecyclerView<T> view) {
    super.fromView(view);
    _itemCount = view.itemCount;
    this.items = view.items;
    this.layoutType = view.layoutType;
    this.spaceBetween = view.spaceBetween;
    this.onPagingListener = view.onPagingListener;
    this.snapCount = view.snapCount;

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

  int get itemCount => min(_itemCount ?? (items.length + 1), size);

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

  /// GRID PROPERTIES
  int snapCount = 1;

  int _gri = 0;

  int get _griEnding => _gri + (snapCount);

  int get _gciEnding => (itemCount / snapCount).ceil();

  Axis get _orientationAsInverse =>
      isVerticalMode ? Axis.horizontal : Axis.vertical;

  int get _gmc {
    final line = (itemCount / snapCount).ceil();
    final require = line * snapCount;
    final missing = require - itemCount;
    return missing.abs();
  }

  List<_RVGItem<T>> get _gis {
    List<_RVGItem<T>> list = [];
    if (items.isNotEmpty) {
      list = items.getRange(0, itemCount).map((e) => _RVGItem(e)).toList();
      if (_gmc > 0) {
        for (int i = 0; i < _gmc; i++) {
          list.add(_RVGItem<T>.temp());
        }
      }
    }
    return list;
  }

  Iterable<_RVGItem<T>> get _gcItems => _gis.getRange(0, _gciEnding);

  Iterable<_RVGItem<T>> get _grItems => _gis.getRange(_gri, _griEnding);

  void _griClear() => _gri = 0;

  void _griIncrement() => _gri++;

  void setSnapCount(int value) {
    super.onNotifyWithCallback(() {
      snapCount = value;
    });
  }

  /// DEFAULT PROPERTIES

  @override
  ScrollController get scrollController {
    if (onPagingListener != null) {
      return super
          .scrollController
          .paging(onListen: onPagingListener ?? (v) {});
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

class RecyclerView<T> extends YMRView<RecyclerViewController<T>> {
  final List<T> items;
  final int? itemCount;
  final int snapCount;
  final double spaceBetween;
  final OnViewChangeListener? onPagingListener;

  final RecyclerLayoutType layoutType;
  final RecyclerViewItemBuilder<T> builder;

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
  void onInit(RecyclerViewController<T> controller) {
    controller._griClear();
  }

  @override
  void onUpdateWidget(RecyclerViewController<T> controller, oldWidget) {
    controller._griClear();
  }

  @override
  void onChangeDependencies(RecyclerViewController<T> controller) {
    controller._griClear();
  }

  @override
  void onDispose(RecyclerViewController<T> controller) => controller._dispose();

  @override
  RecyclerViewController<T> initController() => RecyclerViewController<T>();

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
                ? controller._gcItems.map((item) {
                    return Flex(
                      direction: controller._orientationAsInverse,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: controller._grItems.map((item) {
                        controller._griIncrement();
                        var child = !item.temporary && item.data != null
                            ? builder(controller._gri, item.data as T)
                            : const SizedBox();
                        if (controller.isVerticalMode) {
                          child = Expanded(child: child);
                        }

                        return child;
                      }).toList(),
                    );
                  }).toList()
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

enum RecyclerLayoutType { linear, grid }
