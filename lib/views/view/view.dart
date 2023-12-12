import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../widgets/widget_wrapper.dart';

part 'controller.dart';
part 'typedefs.dart';
part 'value_state.dart';
part 'value_state_type.dart';
part 'view_corner_radius.dart';
part 'view_error.dart';
part 'view_position.dart';
part 'view_position_type.dart';
part 'view_recognizer.dart';
part 'view_roots.dart';
part 'view_scrolling_type.dart';
part 'view_shadow_type.dart';
part 'view_shape.dart';
part 'view_state.dart';
part 'view_toggle_content.dart';

class YMRView<T extends ViewController> extends StatefulWidget {
  final T? controller;

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

  /// INDICATOR AND ACTIVATOR PROPERTIES
  final OnViewActivator? onActivator;

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

  final double? margin;
  final double? marginHorizontal, marginVertical;
  final double? marginTop, marginBottom, marginStart, marginEnd;

  final double? padding;
  final double? paddingHorizontal, paddingVertical;
  final double? paddingTop, paddingBottom, paddingStart, paddingEnd;

  final double? shadow;
  final double? shadowBlurRadius, shadowSpreadRadius;
  final double? shadowHorizontal, shadowVertical;
  final double? shadowStart, shadowEnd, shadowTop, shadowBottom;

  final Color? background, foreground, shadowColor;
  final Color hoverColor, pressedColor, rippleColor;

  final DecorationImage? backgroundImage, foregroundImage;
  final Gradient? backgroundGradient, foregroundGradient, borderGradient;
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

  final OnViewClickListener? onClick, onDoubleClick, onLongClick;
  final OnViewNotifyListener<T>? onClickHandler;
  final OnViewNotifyListener<T>? onDoubleClickHandler;
  final OnViewNotifyListener<T>? onLongClickHandler;
  final OnViewToggleListener? onToggle;
  final OnViewChangeListener? onChange;
  final OnViewErrorListener? onError;
  final OnViewHoverListener? onHover;
  final OnViewValidListener? onValid;
  final OnViewValidatorListener? onValidator;

  const YMRView({
    super.key,
    this.controller,

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

    /// INDICATOR AND ACTIVATOR PROPERTIES
    this.onActivator,

    ///
    ///
    ///
    ///
    this.flex,
    this.absorbMode,
    this.activated,
    this.enabled,
    this.expandable,
    this.visibility,
    this.wrapper,
    this.animation,
    this.animationType,
    this.elevation,
    this.dimensionRatio,
    this.width,
    this.widthState,
    this.widthMax,
    this.widthMin,
    this.height,
    this.heightState,
    this.heightMax,
    this.heightMin,
    this.margin,
    this.marginHorizontal,
    this.marginVertical,
    this.marginTop,
    this.marginBottom,
    this.marginStart,
    this.marginEnd,
    this.padding,
    this.paddingHorizontal,
    this.paddingVertical,
    this.paddingTop,
    this.paddingBottom,
    this.paddingStart,
    this.paddingEnd,
    this.orientation,
    this.scrollable,
    this.scrollController,
    this.scrollingType,
    this.shadow,
    this.shadowBlurRadius,
    this.shadowSpreadRadius,
    this.shadowHorizontal,
    this.shadowVertical,
    this.shadowStart,
    this.shadowEnd,
    this.shadowTop,
    this.shadowBottom,
    this.background,
    this.foreground,
    this.hoverColor = Colors.transparent,
    this.pressedColor = Colors.transparent,
    this.shadowColor,
    this.rippleColor = Colors.transparent,
    this.gravity,
    this.transformGravity,
    this.backgroundBlendMode,
    this.foregroundBlendMode,
    this.backgroundImage,
    this.foregroundImage,
    this.backgroundGradient,
    this.foregroundGradient,
    this.borderGradient,
    this.transform,
    this.shadowBlurStyle,
    this.clipBehavior,
    this.shadowType,
    this.position,
    this.positionType,
    this.shape,
    this.child,
    this.backgroundState,
    this.backgroundGradientState,
    this.backgroundImageState,
    this.onClick,
    this.onDoubleClick,
    this.onLongClick,
    this.onClickHandler,
    this.onDoubleClickHandler,
    this.onLongClickHandler,
    this.onToggle,
    this.onChange,
    this.onError,
    this.onHover,
    this.onValid,
    this.onValidator,
  });

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
  void onDispose(BuildContext context, T controller) => controller._dispose();

  @override
  State<YMRView<T>> createState() => _ViewState<T>();
}
