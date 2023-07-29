part of '../widgets.dart';

class LinearLayout extends YMRView<LinearLayoutController> {
  final LayoutGravity? layoutGravity;
  final MainAxisAlignment? mainGravity;
  final CrossAxisAlignment? crossGravity;
  final OnViewChangeListener? onPagingListener;

  final List<Widget>? children;

  const LinearLayout({
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
    super.pressedColor,
    super.rippleColor,
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
    this.layoutGravity,
    this.mainGravity,
    this.crossGravity,
    this.onPagingListener,
    this.children,
  });

  @override
  LinearLayoutController initController() {
    return LinearLayoutController();
  }

  @override
  ViewRoots initRootProperties() {
    return const ViewRoots(scrollable: false);
  }

  @override
  LinearLayoutController attachController(LinearLayoutController controller) {
    return controller.fromLinearLayout(this);
  }

  @override
  Widget? attach(BuildContext context, LinearLayoutController controller) {
    return controller.scrollable
        ? SingleChildScrollView(
            controller: controller.scrollController,
            physics: controller.scrollingType.physics,
            scrollDirection: controller.orientation,
            child: _LLChild(controller: controller),
          )
        : _LLChild(controller: controller);
  }
}

class _LLChild extends StatelessWidget {
  final LinearLayoutController controller;

  const _LLChild({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return controller.orientation == Axis.vertical
        ? Column(
            mainAxisAlignment: controller.mainGravity,
            crossAxisAlignment: controller.crossGravity,
            children: controller.children,
          )
        : Row(
            mainAxisAlignment: controller.mainGravity,
            crossAxisAlignment: controller.crossGravity,
            children: controller.children,
          );
  }
}

class LinearLayoutController extends ViewController {
  LayoutGravity layoutGravity = LayoutGravity.start;
  MainAxisAlignment? _mainGravity;
  CrossAxisAlignment? _crossGravity;
  ScrollController _scrollController = ScrollController();
  List<Widget> children = [];

  OnViewChangeListener? onPagingListener;

  LinearLayoutController fromLinearLayout(LinearLayout view) {
    super.fromView(view);
    orientation = view.orientation ?? Axis.vertical;
    layoutGravity = view.layoutGravity ?? LayoutGravity.start;
    _mainGravity = view.mainGravity;
    _crossGravity = view.crossGravity;
    scrollable = view.scrollable ?? false;
    scrollingType = view.scrollingType ?? ViewScrollingType.none;
    _scrollController = view.scrollController ?? ScrollController();
    children = view.children ?? [];
    onPagingListener = view.onPagingListener;
    return this;
  }

  MainAxisAlignment get mainGravity => _mainGravity ?? layoutGravity.main;

  CrossAxisAlignment get crossGravity => _crossGravity ?? layoutGravity.cross;

  @override
  ScrollController get scrollController {
    if (onPagingListener != null) {
      return _scrollController.paging(onListen: onPagingListener ?? (v) {});
    } else {
      return _scrollController;
    }
  }
}

enum LayoutGravity {
  center(
    main: MainAxisAlignment.center,
    cross: CrossAxisAlignment.center,
  ),
  end(
    main: MainAxisAlignment.end,
    cross: CrossAxisAlignment.end,
  ),
  start(
    main: MainAxisAlignment.start,
    cross: CrossAxisAlignment.start,
  ),
  spaceAround(
    main: MainAxisAlignment.spaceAround,
    cross: CrossAxisAlignment.center,
  ),
  spaceBetween(
    main: MainAxisAlignment.spaceBetween,
    cross: CrossAxisAlignment.center,
  ),
  spaceEvenly(
    main: MainAxisAlignment.spaceEvenly,
    cross: CrossAxisAlignment.center,
  ),
  baseline(
    main: MainAxisAlignment.center,
    cross: CrossAxisAlignment.baseline,
  ),
  stretch(
    main: MainAxisAlignment.center,
    cross: CrossAxisAlignment.stretch,
  ),
  centerVertical(
    main: MainAxisAlignment.center,
    cross: CrossAxisAlignment.start,
  ),
  centerHorizontal(
    main: MainAxisAlignment.start,
    cross: CrossAxisAlignment.center,
  );

  final MainAxisAlignment main;
  final CrossAxisAlignment cross;

  const LayoutGravity({
    required this.main,
    required this.cross,
  });
}
