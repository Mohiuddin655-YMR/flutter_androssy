import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/value_state.dart';
import '../../utils/view_error.dart';
import '../../utils/view_listener_effect.dart';
import '../../utils/view_position.dart';
import '../../utils/view_roots.dart';
import '../../utils/view_shape.dart';
import 'raw.dart';

part 'controller.dart';
part 'view_corner_radius.dart';
part 'view_listener.dart';
part 'view_scrolling_type.dart';
part 'view_shadow_type.dart';

typedef OnViewActivator = Future<bool> Function(bool running, dynamic value);
typedef OnViewChangeListener<T> = void Function(T value);
typedef OnViewClickListener = void Function(BuildContext context);
typedef OnViewErrorListener = String? Function(ViewError error);
typedef OnViewHoverListener = void Function(bool value);
typedef OnViewToggleListener = void Function(bool value);
typedef OnViewValidListener = void Function(bool value);
typedef OnViewValidatorListener = bool Function(String value);

class BaseView<T extends ViewController> extends StatefulWidget {
  /// ROOT PROPERTIES
  final T? _controller;

  /// CALLBACK PROPERTIES
  final OnViewActivator? onActivator;
  final OnViewChangeListener? onChange;
  final OnViewErrorListener? onError;
  final OnViewHoverListener? onHover;
  final OnViewValidListener? onValid;
  final OnViewValidatorListener? onValidator;

  /// CLICK PROPERTIES
  final ViewClickEffect? clickEffect;
  final OnViewClickListener? onClick, onDoubleClick, onLongClick;
  final OnViewToggleListener? onToggleClick;

  /// BACKDROP PROPERTIES
  final ImageFilter? backdropFilter;
  final BlendMode? backdropMode;

  /// BORDER PROPERTIES
  final Color? borderColor;
  final ValueState<Color>? borderColorState;
  final double? borderSize;
  final ValueState<double>? borderSizeState;
  final double? borderHorizontal, borderVertical;
  final ValueState<double>? borderHorizontalState, borderVerticalState;
  final double? borderTop, borderBottom, borderStart, borderEnd;
  final ValueState<double>? borderTopState, borderBottomState;
  final ValueState<double>? borderStartState, borderEndState;
  final double? borderStrokeAlign;

  /// BORDER RADIUS PROPERTIES
  final double? borderRadius;
  final ValueState<double>? borderRadiusState;
  final double? borderRadiusBL, borderRadiusBR, borderRadiusTL, borderRadiusTR;
  final ValueState<double>? borderRadiusBLState, borderRadiusBRState;
  final ValueState<double>? borderRadiusTLState, borderRadiusTRState;

  /// INDICATOR PROPERTIES
  final bool indicatorVisible;

  /// MARGIN PROPERTIES
  final double? margin;
  final double? marginHorizontal, marginVertical;
  final double? marginTop, marginBottom, marginStart, marginEnd;
  final EdgeInsets? marginCustom;

  /// OPACITY PROPERTIES
  final double? opacity;
  final ValueState<double>? opacityState;
  final bool opacityAlwaysIncludeSemantics;

  /// PADDING PROPERTIES
  final double? padding;
  final double? paddingHorizontal, paddingVertical;
  final double? paddingTop, paddingBottom, paddingStart, paddingEnd;
  final EdgeInsets? paddingCustom;

  /// SHADOW PROPERTIES
  final double? shadow;
  final double? shadowBlurRadius, shadowSpreadRadius;
  final double? shadowHorizontal, shadowVertical;
  final double? shadowStart, shadowEnd, shadowTop, shadowBottom;

  ///
  ///
  ///
  ///
  ///
  final int? flex;
  final bool? absorbMode, activated, enabled, expandable, scrollable, wrapper;

  final int? animation;
  final Curve? animationType;

  final double? elevation;
  final double? dimensionRatio;

  final double? width, widthMax, widthMin;
  final ValueState<double>? widthState;
  final double? height, heightMax, heightMin;
  final ValueState<double>? heightState;

  final Color? background, foreground, shadowColor;
  final Color hoverColor, pressedColor, rippleColor;

  final DecorationImage? backgroundImage, foregroundImage;
  final Gradient? backgroundGradient, foregroundGradient;
  final Matrix4? transform;

  final Alignment? gravity, transformGravity;
  final BlendMode? backgroundBlendMode, foregroundBlendMode;
  final BlurStyle? shadowBlurStyle;
  final Clip? clipBehavior;

  final ValueState<Color>? backgroundState;
  final ValueState<Gradient>? backgroundGradientState;
  final ValueState<DecorationImage>? backgroundImageState;

  final Axis? orientation;
  final ViewScrollingType? scrollingType;
  final ScrollController? scrollController;

  final ViewShadowType? shadowType;
  final ViewPosition? position;
  final ViewPositionType? positionType;
  final ViewShape? shape;
  final bool? visibility;

  final Widget? child;

  const BaseView({
    /// ROOT PROPERTIES
    super.key,

    /// LISTENER PROPERTIES
    this.clickEffect,
    this.onClick,
    this.onDoubleClick,
    this.onLongClick,
    this.onHover,
    this.onToggleClick,

    /// CALLBACK PROPERTIES
    this.onActivator,
    this.onChange,
    this.onError,
    this.onValid,
    this.onValidator,

    ///BASE PROPERTIES
    T? controller,
    this.absorbMode,
    this.activated,
    this.background,
    this.backgroundState,
    this.backgroundBlendMode,
    this.backgroundGradient,
    this.backgroundGradientState,
    this.backgroundImage,
    this.backgroundImageState,
    this.clipBehavior,
    this.dimensionRatio,
    this.elevation,
    this.enabled,
    this.expandable,
    this.foreground,
    this.foregroundBlendMode,
    this.foregroundGradient,
    this.foregroundImage,
    this.flex,
    this.gravity,
    this.height,
    this.heightState,
    this.heightMax,
    this.heightMin,
    this.hoverColor = Colors.transparent,
    this.orientation,
    this.position,
    this.positionType,
    this.pressedColor = Colors.transparent,
    this.rippleColor = Colors.transparent,
    this.scrollable,
    this.scrollController,
    this.scrollingType,
    this.shape,
    this.transform,
    this.transformGravity,
    this.visibility,
    this.width,
    this.widthState,
    this.widthMax,
    this.widthMin,

    /// ANIMATION PROPERTIES
    this.animation,
    this.animationType,

    /// BACKDROP PROPERTIES
    this.backdropFilter,
    this.backdropMode,

    /// BORDER PROPERTIES
    this.borderColor,
    this.borderColorState,
    this.borderSize,
    this.borderSizeState,
    this.borderHorizontal,
    this.borderHorizontalState,
    this.borderVertical,
    this.borderVerticalState,
    this.borderTop,
    this.borderTopState,
    this.borderBottom,
    this.borderBottomState,
    this.borderStart,
    this.borderStartState,
    this.borderEnd,
    this.borderEndState,
    this.borderStrokeAlign,

    /// BORDER RADIUS PROPERTIES
    this.borderRadius,
    this.borderRadiusState,
    this.borderRadiusBL,
    this.borderRadiusBLState,
    this.borderRadiusBR,
    this.borderRadiusBRState,
    this.borderRadiusTL,
    this.borderRadiusTLState,
    this.borderRadiusTR,
    this.borderRadiusTRState,

    /// INDICATOR PROPERTIES
    this.indicatorVisible = false,

    /// MARGIN PROPERTIES
    this.margin,
    this.marginHorizontal,
    this.marginVertical,
    this.marginTop,
    this.marginBottom,
    this.marginStart,
    this.marginEnd,
    this.marginCustom,

    /// OPACITY PROPERTIES
    this.opacity,
    this.opacityState,
    this.opacityAlwaysIncludeSemantics = false,

    /// PADDING PROPERTIES
    this.padding,
    this.paddingHorizontal,
    this.paddingVertical,
    this.paddingTop,
    this.paddingBottom,
    this.paddingStart,
    this.paddingEnd,
    this.paddingCustom,

    /// SHADOW PROPERTIES
    this.shadow,
    this.shadowBlurRadius,
    this.shadowBlurStyle,
    this.shadowColor,
    this.shadowType,
    this.shadowSpreadRadius,
    this.shadowHorizontal,
    this.shadowVertical,
    this.shadowStart,
    this.shadowEnd,
    this.shadowTop,
    this.shadowBottom,

    /// OPTIONAL PROPERTIES
    this.wrapper,
    this.child,
  }) : _controller = controller;

  T get controller => _controller ?? initController();

  T initController() => ViewController() as T;

  T attachController(T controller) => controller.fromView(this) as T;

  void onViewCreated(BuildContext context, T controller) {}

  void onToggleHandler(BuildContext context, T controller) {}

  Widget root(BuildContext context, T controller, Widget parent) => parent;

  Widget build(BuildContext context, T controller, Widget parent) => parent;

  Widget? attach(BuildContext context, T controller) => controller.child;

  ViewRoots initRootProperties() => const ViewRoots();

  @mustCallSuper
  void onInit(BuildContext context, T controller) {}

  @mustCallSuper
  void onReady(BuildContext context, T controller) {}

  @mustCallSuper
  void onUpdateWidget(BuildContext context, T controller, dynamic oldWidget) {}

  @mustCallSuper
  void onChangeDependencies(BuildContext context, T controller) {}

  @mustCallSuper
  void onDispose(BuildContext context, T controller) => controller.dispose();

  @override
  State<BaseView<T>> createState() => _State<T>();
}

class _State<T extends ViewController> extends State<BaseView<T>> {
  late T controller;

  @override
  void initState() {
    super.initState();
    controller = widget.attachController(widget.controller);
    widget.onInit(context, controller);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onReady(context, controller);
    });
  }

  @override
  void didUpdateWidget(covariant BaseView<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.onUpdateWidget(context, controller, oldWidget);
  }

  @override
  void didChangeDependencies() {
    widget.onChangeDependencies(context, controller);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget.onDispose(context, controller);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._controller != null) {
      return ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          controller.context = context;
          return _View(
            controller: controller,
            attach: widget.attach,
            builder: widget.build,
            root: widget.root,
          );
        },
      );
    }
    return _View(
      controller: controller,
      attach: widget.attach,
      builder: widget.build,
      root: widget.root,
    );
  }
}

class _View<T extends ViewController> extends StatelessWidget {
  final T controller;
  final Widget? Function(BuildContext _, T __) attach;
  final Widget Function(BuildContext _, T __, Widget ___) builder;
  final Widget Function(BuildContext _, T __, Widget ___) root;

  const _View({
    super.key,
    required this.controller,
    required this.attach,
    required this.builder,
    required this.root,
  });

  @override
  Widget build(BuildContext context) {
    controller.context = context;

    /// INITIAL
    Widget child = const SizedBox();

    /// STYLES
    if (controller.roots.view) {
      final root = controller.roots;
      final isCircular = controller.isCircular;
      final isRadius = controller.isBorderRadius;
      final isRippleMode = controller.isInkWellMode;
      final isMargin = controller.isMargin;
      final isConstraints = controller.isConstraints;

      final borderRadius = !isRippleMode && isRadius && !isCircular
          ? controller.borderRadius
          : null;

      child = Container(
        alignment: controller.gravity,
        clipBehavior: root.decoration && !isRippleMode
            ? controller.clipBehavior
            : Clip.none,
        width: controller.width,
        height: controller.height,
        transform: controller.transform,
        transformAlignment: controller.transformGravity,
        constraints: isConstraints
            ? BoxConstraints(
                maxWidth: controller.widthMax,
                minWidth: controller.widthMin,
                maxHeight: controller.heightMax,
                minHeight: controller.heightMin,
              )
            : null,
        decoration: root.decoration
            ? BoxDecoration(
                backgroundBlendMode: controller.backgroundBlendMode,
                border: controller.isBorder ? controller.boxBorder : null,
                borderRadius: isCircular ? null : borderRadius,
                color: root.background && !isRippleMode
                    ? controller.background
                    : null,
                gradient: controller.backgroundGradient,
                image: controller.backgroundImage,
                boxShadow: controller.shadows,
                shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
              )
            : null,
        foregroundDecoration: root.decoration
            ? BoxDecoration(
                backgroundBlendMode: controller.foregroundBlendMode,
                borderRadius: borderRadius,
                color: controller.foreground,
                gradient: controller.foregroundGradient,
                image: controller.foregroundImage,
                shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
              )
            : null,
        margin: isMargin && !isRippleMode ? controller.margin : null,
        padding: controller.isPadding && !controller.isScrollable
            ? controller.padding
            : null,
        child: child,
      );
    }

    /// CALLBACKS
    if (controller.isClickMode) {
      child = ViewListener(
        controller: controller,
        child: child,
      );
    }
    return AndrossyView(
      visible: controller.visible,
      scrollable: controller.isScrollable,
      scrollController: controller.scrollController,
      scrollingType: controller.scrollingType,
      orientation: controller.orientation,
      padding: controller.padding,
      backdropFilter: controller.backdropFilter,
      backdropMode: controller.backdropMode,
      roots: controller.roots,
      isCircular: controller.isCircular,
      isBorderRadius: controller.isBorderRadius,
      isMargin: controller.isMargin,
      isConstraints: controller.isConstraints,
      borderRadius: controller.borderRadius,
      animationEnabled: controller.animationEnabled,
      animation: controller.animation,
      animationType: controller.animationType,
      gravity: controller.gravity,
      clipBehavior: controller.clipBehavior,
      width: controller.width,
      height: controller.height,
      transform: controller.transform,
      transformGravity: controller.transformGravity,
      widthMax: controller.widthMax,
      widthMin: controller.widthMin,
      heightMax: controller.heightMax,
      heightMin: controller.heightMin,
      backgroundBlendMode: controller.backgroundBlendMode,
      foregroundBlendMode: controller.foregroundBlendMode,
      isBorder: controller.isBorder,
      boxBorder: controller.boxBorder,
      attach: (_) => attach(_, controller),
      builder: (_, __) => builder(_, controller, __),
      root: (_, __) => root(_, controller, __),
      background: controller.background,
      backgroundGradient: controller.backgroundGradient,
      backgroundImage: controller.backgroundImage,
      shadows: controller.shadows,
      foreground: controller.foreground,
      foregroundGradient: controller.foregroundGradient,
      foregroundImage: controller.foregroundImage,
      margin: controller.margin,
      isPadding: controller.isPadding,
      isScrollable: controller.isScrollable,
      isOpacity: controller.isOpacity,
      opacity: controller.opacity,
      opacityAlwaysIncludeSemantics: controller.opacityAlwaysIncludeSemantics,
      onNotifyWrapper: controller.isWrapper ? controller.onNotifyWrapper : null,
      absorbMode: controller.absorbMode,
      isClickMode: controller.isClickMode,
      isDimensional: controller.isDimensional,
      dimensionRatio: controller.dimensionRatio,
      isFlexible: controller.isExpendable,
      flex: controller.flex,
      isPositional: controller.isPositional,
      position: controller.position,
      elevation: controller.elevation,
      maxSize: controller.maxSize,
      isInkWellMode: controller.isInkWellMode,
      rippleColor: controller.rippleColor,
      hoverColor: controller.hoverColor,
      pressedColor: controller.pressedColor,
      clickEffect: controller.clickEffect,
      onClick: controller.onClick,
      onDoubleClick: controller.onDoubleClick,
      onLongClick: controller.onLongClick,
      onNotifyHover: controller.onNotifyHover,
      onNotifyToggle: controller.onNotifyToggle,
    );
  }
}
