part of '../widgets.dart';

class LinearLayoutController extends ViewController {
  ScrollController _scrollController = ScrollController();

  @override
  set scrollController(ScrollController value) => _scrollController = value;

  void setScrollController(ScrollController value) {
    onNotifyWithCallback(() => scrollController = value);
  }

  LayoutGravity layoutGravity = LayoutGravity.start;

  void setLayoutGravity(LayoutGravity value) {
    onNotifyWithCallback(() => layoutGravity = value);
  }

  CrossAxisAlignment? _crossGravity;

  set crossGravity(CrossAxisAlignment? value) => _crossGravity = value;

  void setCrossGravity(CrossAxisAlignment value) {
    onNotifyWithCallback(() => crossGravity = value);
  }

  MainAxisAlignment? _mainGravity;

  set mainGravity(MainAxisAlignment? value) => _mainGravity = value;

  void setMainGravity(MainAxisAlignment value) {
    onNotifyWithCallback(() => mainGravity = value);
  }

  MainAxisSize mainAxisSize = MainAxisSize.min;

  void setMainAxisSize(MainAxisSize value) {
    onNotifyWithCallback(() => mainAxisSize = value);
  }

  TextBaseline? textBaseline;

  void setTextBaseLine(TextBaseline? value) {
    onNotifyWithCallback(() => textBaseline = value);
  }

  TextDirection? textDirection;

  void setTextDirection(TextDirection? value) {
    onNotifyWithCallback(() => textDirection = value);
  }

  VerticalDirection verticalDirection = VerticalDirection.down;

  void setVerticalDirection(VerticalDirection value) {
    onNotifyWithCallback(() => verticalDirection = value);
  }

  List<Widget> children = [];

  void setChildren(List<Widget> value) {
    onNotifyWithCallback(() => children = value);
  }

  OnViewChangeListener? _onPaging;

  OnViewChangeListener? get onPaging => enabled ? _onPaging : null;

  set onPaging(OnViewChangeListener? listener) => _onPaging ??= listener;

  void setOnPagingListener(OnViewChangeListener listener) {
    onPaging = listener;
  }

  LinearLayoutController fromLinearLayout(LinearLayout view) {
    super.fromView(view);
    scrollController = view.scrollController ?? ScrollController();
    orientation = view.orientation ?? Axis.vertical;
    layoutGravity = view.layoutGravity ?? LayoutGravity.start;
    mainGravity = view.mainGravity;
    mainAxisSize = view.mainAxisSize;
    crossGravity = view.crossGravity;
    scrollable = view.scrollable ?? false;
    scrollingType = view.scrollingType ?? ViewScrollingType.none;
    textBaseline = view.textBaseline;
    textDirection = view.textDirection;
    verticalDirection = view.verticalDirection;
    children = view.children ?? [];
    onPaging = view.onPaging;
    return this;
  }

  MainAxisAlignment get mainGravity => _mainGravity ?? layoutGravity.main;

  CrossAxisAlignment get crossGravity => _crossGravity ?? layoutGravity.cross;

  @override
  ScrollController get scrollController {
    if (onPaging != null) {
      return _scrollController.paging(onListen: onPaging ?? (v) {});
    } else {
      return _scrollController;
    }
  }
}

class LinearLayout<T extends LinearLayoutController> extends YMRView<T> {
  final LayoutGravity? layoutGravity;
  final CrossAxisAlignment? crossGravity;
  final MainAxisAlignment? mainGravity;
  final MainAxisSize mainAxisSize;
  final TextBaseline? textBaseline;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final OnViewChangeListener? onPaging;

  final List<Widget>? children;

  const LinearLayout({
    /// ROOT PROPERTIES
    super.key,
    super.controller,

    ///BASE PROPERTIES
    super.absorbMode,
    super.activated,
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
    super.heightState,
    super.heightMax,
    super.heightMin,
    super.hoverColor,
    super.orientation,
    super.position,
    super.positionType,
    super.pressedColor,
    super.rippleColor,
    super.scrollable,
    super.scrollController,
    super.scrollingType,
    super.shape,
    super.transform,
    super.transformGravity,
    super.width,
    super.widthState,
    super.widthMax,
    super.widthMin,
    super.visibility,

    /// ANIMATION PROPERTIES
    super.animation,
    super.animationType,

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
    super.borderStrokeAlign,

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

    /// MARGIN PROPERTIES
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,

    /// PADDING PROPERTIES
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,

    /// SHADOW PROPERTIES
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

    /// LISTENER PROPERTIES
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onHover,
    super.onToggle,
    super.onValid,

    /// CHILD PROPERTIES
    this.layoutGravity,
    this.mainGravity,
    this.mainAxisSize = MainAxisSize.min,
    this.crossGravity,
    this.textBaseline,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.onPaging,
    this.children,
  });

  @override
  T initController() => LinearLayoutController() as T;

  @override
  T attachController(T controller) => controller.fromLinearLayout(this) as T;

  @override
  Widget? attach(BuildContext context, T controller) {
    return controller.orientation == Axis.vertical
        ? Column(
            mainAxisAlignment: controller.mainGravity,
            mainAxisSize: controller.mainAxisSize,
            crossAxisAlignment: controller.crossGravity,
            textBaseline: controller.textBaseline,
            textDirection: controller.textDirection,
            verticalDirection: controller.verticalDirection,
            children: controller.children,
          )
        : Row(
            mainAxisAlignment: controller.mainGravity,
            mainAxisSize: controller.mainAxisSize,
            crossAxisAlignment: controller.crossGravity,
            textBaseline: controller.textBaseline,
            textDirection: controller.textDirection,
            verticalDirection: controller.verticalDirection,
            children: controller.children,
          );
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
