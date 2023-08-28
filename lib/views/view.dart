part of '../widgets.dart';

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

  /// BORDER RADIUS PROPERTIES
  final double? borderRadius;
  final ValueState<double>? borderRadiusState;
  final double? borderRadiusBL, borderRadiusBR, borderRadiusTL, borderRadiusTR;
  final ValueState<double>? borderRadiusBLState, borderRadiusBRState;
  final ValueState<double>? borderRadiusTLState, borderRadiusTRState;

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
    Key? key,
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
  }) : super(key: key);

  T initController() => ViewController() as T;

  T attachController(T controller) => controller.fromView(this) as T;

  void onViewCreated(BuildContext context, T controller) {}

  void onToggleHandler(BuildContext context, T controller) {}

  Widget root(BuildContext context, T controller, Widget parent) => parent;

  Widget build(BuildContext context, T controller, Widget parent) => parent;

  Widget? attach(BuildContext context, T controller) => controller.child;

  ViewRoots initRootProperties() => const ViewRoots();

  void onInit(T controller) {}

  void onUpdateWidget(T controller, dynamic oldWidget) {}

  void onChangeDependencies(T controller) {}

  void onDispose(T controller) {}

  @override
  State<YMRView<T>> createState() => _YMRViewState<T>();
}

class _YMRViewState<T extends ViewController> extends State<YMRView<T>> {
  late T controller;

  @override
  void initState() {
    controller = widget.controller ?? widget.initController();
    controller.setNotifier(setState);
    controller = widget.attachController(controller);
    widget.onInit(controller);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant YMRView<T> oldWidget) {
    controller = widget.attachController(controller);
    widget.onUpdateWidget(controller, oldWidget);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    widget.onChangeDependencies(controller);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget.onDispose(controller);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.context = context;

    /// INITIAL #1
    Widget child = const SizedBox();

    /// VISIBILITY
    if (controller.visible) {
      /// ATTACH #2
      child = widget.attach(context, controller) ?? child;

      /// SCROLLER #3
      if (controller.isScrollable) {
        child = SingleChildScrollView(
          controller: controller.scrollController,
          physics: controller.scrollingType.physics,
          scrollDirection: controller.orientation,
          padding: controller.padding,
          child: child,
        );
      }

      /// STYLES #4
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

      /// BUILDER #5
      child = widget.build(context, controller, child);

      /// WRAPPER #6
      if (controller.isWrapper) {
        child = WidgetWrapper(
          wrapper: controller.onNotifyWrapper,
          child: child,
        );
      }

      /// ABSORBER #7
      if (controller.absorbMode) {
        child = AbsorbPointer(child: child);
      }

      /// CALLBACKS #8
      if (controller.isObservable) {
        if (controller.isInkWellMode) {
          /// RIPPLED MODE #8.1
          child = Padding(
            padding: controller.isMargin ? controller.margin : EdgeInsets.zero,
            child: Material(
              elevation: controller.elevation,
              borderRadius: controller.isCircular
                  ? BorderRadius.circular(controller.maxSize)
                  : controller.borderRadius,
              color: controller.background,
              clipBehavior: controller.clipBehavior,
              child: InkWell(
                splashColor: controller.rippleColor,
                hoverColor: controller.hoverColor,
                highlightColor: controller.pressedColor,
                onHover: controller.onNotifyHover,
                onTap: controller.isClickable
                    ? () {
                        if (controller.isToggleClickable) {
                          controller.onNotifyToggle();
                        } else {
                          controller.onClickHandler != null
                              ? controller.onClickHandler?.call(controller)
                              : controller.onClick?.call(context);
                        }
                      }
                    : null,
                onDoubleTap: controller.isDoubleClickable
                    ? () {
                        controller.onDoubleClickHandler != null
                            ? controller.onDoubleClickHandler?.call(controller)
                            : controller.onDoubleClick?.call(context);
                      }
                    : null,
                onLongPress: controller.isLongClickable
                    ? () {
                        controller.onLongClickHandler != null
                            ? controller.onLongClickHandler?.call(controller)
                            : controller.onLongClick?.call(context);
                      }
                    : null,
                child: child,
              ),
            ),
          );
        } else {
          /// GESTURE MODE #8.2
          child = GestureDetector(
            onTap: controller.isClickable
                ? () {
                    if (controller.isToggleClickable) {
                      controller.onNotifyToggle();
                    } else {
                      controller.onClickHandler != null
                          ? controller.onClickHandler?.call(controller)
                          : controller.onClick?.call(context);
                    }
                  }
                : null,
            onDoubleTap: controller.isDoubleClickable
                ? () {
                    controller.onDoubleClickHandler != null
                        ? controller.onDoubleClickHandler?.call(controller)
                        : controller.onDoubleClick?.call(context);
                  }
                : null,
            onLongPress: controller.isLongClickable
                ? () {
                    controller.onLongClickHandler != null
                        ? controller.onLongClickHandler?.call(controller)
                        : controller.onLongClick?.call(context);
                  }
                : null,
            child: child,
          );
        }
      }

      /// DIMENSION #9
      if (controller.isDimensional) {
        child = AspectRatio(
          aspectRatio: controller.dimensionRatio,
          child: child,
        );
      }

      /// EXPENDABLE #10
      if (controller.isExpendable) {
        child = Expanded(
          flex: controller.flex,
          child: child,
        );
      }

      /// POSITION #11
      if (controller.isPositional) {
        child = Positioned(
          top: controller.position.top,
          bottom: controller.position.bottom,
          left: controller.position.left,
          right: controller.position.right,
          child: child,
        );
      }

      /// ROOT (FINAL)
      child = widget.root(context, controller, child);
    }

    /// BUILD
    return child;
  }
}
