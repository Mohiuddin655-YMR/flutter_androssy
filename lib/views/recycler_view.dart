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
  RecyclerViewController<T> fromRecyclerView(RecyclerView<T> view) {
    super.fromView(view);
    _itemCount = view.itemCount;
    this.items = view.items;
    this.layoutType = view.layoutType;
    this.separator = view.separator;
    this.onPagingListener = view.onPagingListener;

    /// GRID PROPERTIES
    this.snapCount = view.snapCount;

    return this;
  }

  List<T> items = [];
  int? _itemCount;
  double separator = 0;
  RecyclerLayoutType layoutType = RecyclerLayoutType.linear;
  OnViewChangeListener? onPagingListener;

  T get firstItem => items.first;

  T get lastItem => items.last;

  int get size => items.length;

  int get itemCount => min(_itemCount ?? (items.length + 1), size);

  bool get isGridMode => layoutType == RecyclerLayoutType.grid && snapCount > 1;

  bool get isValidItemCountingOrSnapping => itemCount > 0 && snapCount > 0;

  bool get isVerticalMode => orientation == Axis.vertical;

  bool get isSeparator => separator > 0;

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

  ScrollController paging({required Function() func}) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          func();
        }
      }
    });
    return scrollController;
  }

  T? getItem(int index) => size > 0 && size > index ? items[index] : null;

  void setItem(T value, [int? index]) {
    if (index != null && items.length >= index) {
      items.insert(index, value);
    } else {
      items.add(value);
    }
  }

  void removeItem(T? item) {
    if (item != null) {
      items.remove(item);
      _notify;
    }
  }

  void removeAt(int index) {
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      _notify;
    }
  }

  void setItems(List<T> value) {
    items = value;
    _notify;
  }

  void setItemCount(int value) {
    _itemCount = value;
    _notify;
  }

  void setRecyclerType(RecyclerLayoutType value) {
    layoutType = value;
    _notify;
  }

  void _dispose() {
    scrollController.dispose();
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
    snapCount = value;
    _notify;
  }
}

class RecyclerView<T> extends YMRView<RecyclerViewController<T>> {
  final List<T> items;
  final int? itemCount;
  final int snapCount;
  final double separator;
  final OnViewChangeListener? onPagingListener;

  final RecyclerLayoutType layoutType;
  final RecyclerViewItemBuilder<T> builder;

  const RecyclerView({
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
    super.enabled,
    super.elevation,
    super.expandable,
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
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onToggle,
    required this.items,
    required this.builder,
    this.itemCount,
    this.snapCount = 1,
    this.separator = 0,
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
                    if (controller.isSeparator) {
                      return Flex(
                        direction: controller.orientation,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          builder(index, item),
                          if (controller.lastItem != item)
                            SizedBox(
                              width: controller.isVerticalMode
                                  ? 0
                                  : controller.separator,
                              height: controller.isVerticalMode
                                  ? controller.separator
                                  : 0,
                            ),
                        ],
                      );
                    } else {
                      return builder(index, item);
                    }
                  }),
          )
        : null;
  }
}

enum RecyclerLayoutType { linear, grid }
