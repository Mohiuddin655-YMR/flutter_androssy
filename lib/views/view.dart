part of '../widgets.dart';

typedef OnViewBuilder<T> = Widget Function(BuildContext context, T? controller);
typedef OnViewChangeListener = Function(dynamic value);
typedef OnViewClickListener = Function(BuildContext context);
typedef OnViewItemClickListener<T> = void Function(BuildContext contex, T item);
typedef OnViewErrorListener = String? Function(ViewError error);
typedef OnViewToggleListener = Function(bool value);
typedef OnViewHoverListener = Function(bool value);
typedef OnViewValidListener = Function(bool value);
typedef OnViewValidatorListener = bool Function(String value);

typedef OnViewToggleHandler<T extends ViewController> = Function(
  BuildContext context,
  T controller,
);
typedef OnViewAttachBuilder<T extends ViewController> = Widget? Function(
  BuildContext context,
  T controller,
);
typedef OnViewModifyBuilder<T extends ViewController> = Widget Function(
  BuildContext context,
  T controller,
  Widget parent,
);
typedef OnViewNotifier = void Function(VoidCallback fn);
typedef OnViewNotifyListener<T extends ViewController> = Function(T controller);

class ValueState<T> {
  final T? primary;
  final T? secondary;
  final T? ternary;
  final T? disable;
  final T? error;
  final T? hover;

  const ValueState({
    this.primary,
    this.secondary,
    this.ternary,
    this.disable,
    this.error,
    this.hover,
  });

  T? detect(
    bool activated, {
    bool enabled = true,
    bool error = false,
    bool hover = false,
  }) {
    if (enabled) {
      if (hover) {
        return this.hover ?? secondary ?? primary;
      } else if (error) {
        return this.error ?? ternary ?? primary;
      } else if (activated) {
        return secondary ?? primary;
      } else {
        return primary;
      }
    } else {
      return disable ?? ternary ?? primary;
    }
  }

  factory ValueState.activation({
    T? activated,
    T? unactivated,
    T? disabled,
  }) {
    return ValueState<T>(
      primary: unactivated,
      secondary: activated,
      disable: disabled,
    );
  }

  T? activator(bool activated, [bool enabled = true]) {
    if (enabled) {
      return activated ? secondary : primary;
    } else {
      return disable ?? primary;
    }
  }

  factory ValueState.selection({
    T? selected,
    T? unselected,
    T? disabled,
  }) {
    return ValueState<T>(
      primary: unselected,
      secondary: selected,
      disable: disabled,
    );
  }

  T? selector(bool selected, [bool enabled = true]) {
    if (enabled) {
      return selected ? secondary : primary;
    } else {
      return disable ?? primary;
    }
  }

  T? fromController(ViewController controller) {
    return detect(
      controller.activated,
      enabled: controller.enabled,
      error: controller.error,
      hover: controller.hover,
    );
  }

  T? fromType(ValueStateType state) {
    switch (state) {
      case ValueStateType.secondary:
        return secondary ?? primary;
      case ValueStateType.ternary:
        return ternary ?? primary;
      case ValueStateType.disabled:
        return disable ?? primary;
      case ValueStateType.error:
        return error ?? primary;
      case ValueStateType.hover:
        return hover ?? primary;
      default:
        return primary;
    }
  }
}

enum ValueStateType {
  primary,
  secondary,
  ternary,
  disabled,
  error,
  hover,
}

enum ViewError {
  none,
  empty,
  invalid,
  alreadyFound,
  maximum,
  minimum,
  unmodified,
}

extension ViewErrorExtension on ViewError {
  bool get isEmpty => this == ViewError.empty;

  bool get isInvalid => this == ViewError.invalid;

  bool get isMaximum => this == ViewError.maximum;

  bool get isMinimum => this == ViewError.minimum;

  bool get isUnavailable => this == ViewError.alreadyFound;

  bool get isUnmodified => this == ViewError.unmodified;
}

class ViewPosition {
  final double? top, bottom, left, right;

  const ViewPosition({
    this.top,
    this.bottom,
    this.left,
    this.right,
  });
}

enum ViewPositionType {
  /// Left positions
  left(ViewPosition(left: 0)),
  leftTop(ViewPosition(left: 0, top: 0)),
  leftBottom(ViewPosition(left: 0, bottom: 0)),
  leftFlex(ViewPosition(left: 0, top: 0, bottom: 0)),

  /// Right positions
  right(ViewPosition(right: 0)),
  rightTop(ViewPosition(right: 0, top: 0)),
  rightBottom(ViewPosition(right: 0, bottom: 0)),
  rightFlex(ViewPosition(right: 0, top: 0, bottom: 0)),

  /// Top positions
  top(ViewPosition(top: 0)),
  topLeft(ViewPosition(top: 0, left: 0)),
  topRight(ViewPosition(top: 0, right: 0)),
  topFlex(ViewPosition(top: 0, left: 0, right: 0)),

  /// Bottom positions
  bottom(ViewPosition(bottom: 0)),
  bottomLeft(ViewPosition(bottom: 0, left: 0)),
  bottomRight(ViewPosition(bottom: 0, right: 0)),
  bottomFlex(ViewPosition(bottom: 0, left: 0, right: 0)),

  /// Center positions
  center,
  centerFlexX(ViewPosition(left: 0, right: 0)),
  centerFlexY(ViewPosition(top: 0, bottom: 0)),
  centerFill(ViewPosition(left: 0, right: 0, top: 0, bottom: 0));

  final ViewPosition position;

  const ViewPositionType([
    this.position = const ViewPosition(),
  ]);
}

extension ViewPositionExtension on ViewPositionType? {
  ViewPositionType get use => this ?? ViewPositionType.center;

  /// Left positions
  bool get isLeft => use == ViewPositionType.left;

  bool get isLeftTop => use == ViewPositionType.leftTop;

  bool get isLeftBottom => use == ViewPositionType.leftBottom;

  bool get isLeftFlex => use == ViewPositionType.leftFlex;

  bool get isLeftMode {
    return isLeft || isLeftTop || isLeftBottom || isLeftFlex;
  }

  /// Right positions
  bool get isRight => use == ViewPositionType.right;

  bool get isRightTop => use == ViewPositionType.rightTop;

  bool get isRightBottom => use == ViewPositionType.rightBottom;

  bool get isRightFlex => use == ViewPositionType.rightFlex;

  bool get isRightMode {
    return isRight || isRightTop || isRightBottom || isRightFlex;
  }

  bool get isXMode => isLeftMode || isRightMode;

  /// Top positions
  bool get isTop => use == ViewPositionType.top;

  bool get isTopLeft => use == ViewPositionType.topLeft;

  bool get isTopRight => use == ViewPositionType.topRight;

  bool get isTopFlex => use == ViewPositionType.topFlex;

  bool get isTopMode {
    return isTop || isTopLeft || isTopRight || isTopFlex;
  }

  /// Bottom positions
  bool get isBottom => use == ViewPositionType.bottom;

  bool get isBottomLeft => use == ViewPositionType.bottomLeft;

  bool get isBottomRight => use == ViewPositionType.bottomRight;

  bool get isBottomFlex => use == ViewPositionType.bottomFlex;

  bool get isBottomMode {
    return isBottom || isBottomLeft || isBottomRight || isBottomFlex;
  }

  bool get isYMode => isTopMode || isBottomMode;

  /// Center positions
  bool get isCenter => use == ViewPositionType.center;

  bool get isCenterFlexX => use == ViewPositionType.centerFlexX;

  bool get isCenterFlexY => use == ViewPositionType.centerFlexY;

  bool get isCenterFill => use == ViewPositionType.centerFill;

  bool get isCenterMode {
    return isCenter || isCenterFlexX || isCenterFlexY || isCenterFill;
  }
}

class ViewRecognizer {
  final BuildContext context;

  const ViewRecognizer.of(this.context);

  GestureRecognizer? onClick(OnViewClickListener? callback) {
    if (callback != null) {
      return TapGestureRecognizer()..onTap = () => callback(context);
    } else {
      return null;
    }
  }

  GestureRecognizer? onDoubleClick(OnViewClickListener? callback) {
    if (callback != null) {
      return DoubleTapGestureRecognizer()
        ..onDoubleTap = () => callback(context);
    } else {
      return null;
    }
  }

  GestureRecognizer? onLongClick(OnViewClickListener? callback) {
    if (callback != null) {
      return LongPressGestureRecognizer()
        ..onLongPress = () => callback(context);
    } else {
      return null;
    }
  }
}

extension ViewRecognizerExtension on BuildContext {
  GestureRecognizer? onClick(OnViewClickListener? callback) {
    return ViewRecognizer.of(this).onClick(callback);
  }

  GestureRecognizer? onDoubleClick(OnViewClickListener? callback) {
    return ViewRecognizer.of(this).onDoubleClick(callback);
  }

  GestureRecognizer? onLongClick(OnViewClickListener? callback) {
    return ViewRecognizer.of(this).onLongClick(callback);
  }
}

class ViewRoots {
  final bool scrollable;
  final bool position, flex, ratio, observer;
  final bool view, constraints, margin, padding;
  final bool decoration, shadow, shape, radius, border, background;

  const ViewRoots({
    this.scrollable = true,
    this.position = true,
    this.flex = true,
    this.ratio = true,
    this.observer = true,
    this.view = true,
    this.constraints = true,
    this.margin = true,
    this.padding = true,
    this.decoration = true,
    this.shadow = true,
    this.shape = true,
    this.radius = true,
    this.border = true,
    this.background = true,
  });

  ViewRoots modify({
    bool? ripple,
    bool? position,
    bool? flex,
    bool? ratio,
    bool? observer,
    bool? view,
    bool? constraints,
    bool? margin,
    bool? padding,
    bool? decoration,
    bool? shadow,
    bool? shape,
    bool? radius,
    bool? border,
    bool? background,
  }) {
    return ViewRoots(
      position: position ?? this.position,
      flex: flex ?? this.flex,
      ratio: ratio ?? this.ratio,
      observer: observer ?? this.observer,
      view: view ?? this.view,
      constraints: constraints ?? this.constraints,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      decoration: decoration ?? this.decoration,
      shadow: shadow ?? this.shadow,
      shape: shape ?? this.shape,
      radius: radius ?? this.radius,
      border: border ?? this.border,
      background: background ?? this.background,
    );
  }
}

enum ViewScrollingType {
  bouncing(physics: BouncingScrollPhysics()),
  page(physics: PageScrollPhysics()),
  none;

  final ScrollPhysics? physics;

  const ViewScrollingType({this.physics});
}

enum ViewShadowType { overlay, none }

enum ViewShape { circular, rectangular, squire }

class ViewController {
  @mustCallSuper
  ViewController fromView(YMRView view) {
    hoverColor = view.hoverColor;
    pressedColor = view.pressedColor;
    rippleColor = view.rippleColor;

    /// VIEW CONDITIONAL PROPERTIES
    absorbMode = view.absorbMode ?? false;
    activated = view.activated ?? false;
    enabled = view.enabled ?? true;
    expandable = view.expandable ?? false;

    /// ANIMATION PROPERTIES
    animation = view.animation ?? 0;
    animationType = view.animationType ?? Curves.linear;

    /// VIEW SIZE PROPERTIES
    flex = view.flex ?? 0;
    _dimensionRatio = view.dimensionRatio;
    elevation = view.elevation ?? 0;
    _width = view.width;
    widthState = view.widthState;
    _widthMax = view.widthMax;
    _widthMin = view.widthMin;
    _height = view.height;
    heightState = view.heightState;
    _heightMax = view.heightMax;
    _heightMin = view.heightMin;

    /// VIEW MARGIN PROPERTIES
    _margin = view.margin ?? 0;
    marginVertical = view.marginVertical;
    _marginStart = view.marginStart;
    _marginEnd = view.marginEnd;
    _marginTop = view.marginTop;
    _marginBottom = view.marginBottom;
    marginHorizontal = view.marginHorizontal;

    /// VIEW PADDING PROPERTIES
    _padding = view.padding ?? 0;
    _paddingStart = view.paddingStart;
    _paddingEnd = view.paddingEnd;
    _paddingTop = view.paddingTop;
    _paddingBottom = view.paddingBottom;
    paddingHorizontal = view.paddingHorizontal;
    paddingVertical = view.paddingVertical;

    /// VIEW BORDER PROPERTIES
    borderColor = view.borderColor;
    borderGradient = view.borderGradient;
    _borderSize = view.border ?? 0;
    _borderStart = view.borderStart;
    _borderEnd = view.borderEnd;
    _borderTop = view.borderTop;
    _borderBottom = view.borderBottom;
    borderHorizontal = view.borderHorizontal;
    borderVertical = view.borderVertical;

    /// VIEW BORDER RADIUS PROPERTIES
    _borderRadius = view.borderRadius ?? 0;
    _borderRadiusBL = view.borderRadiusBL;
    _borderRadiusBR = view.borderRadiusBR;
    _borderRadiusTL = view.borderRadiusTL;
    _borderRadiusTR = view.borderRadiusTR;

    /// VIEW SHADOW PROPERTIES
    shadowColor = view.shadowColor;
    shadow = view.shadow ?? 0;
    _shadowStart = view.shadowStart;
    _shadowEnd = view.shadowEnd;
    _shadowTop = view.shadowTop;
    _shadowBottom = view.shadowBottom;
    shadowHorizontal = view.shadowHorizontal;
    shadowVertical = view.shadowVertical;
    shadowBlurRadius = view.shadowBlurRadius ?? 5;
    shadowBlurStyle = view.shadowBlurStyle ?? BlurStyle.normal;
    shadowSpreadRadius = view.shadowSpreadRadius ?? 0;
    shadowType = view.shadowType ?? ViewShadowType.none;

    /// VIEW DECORATION PROPERTIES
    _background = view.background;
    foreground = view.foreground;
    backgroundBlendMode = view.backgroundBlendMode;
    foregroundBlendMode = view.foregroundBlendMode;
    _backgroundGradient = view.backgroundGradient;
    foregroundGradient = view.foregroundGradient;
    _backgroundImage = view.backgroundImage;
    foregroundImage = view.foregroundImage;
    clipBehavior = view.clipBehavior ?? Clip.antiAlias;
    gravity = view.gravity;
    orientation = view.orientation ?? Axis.vertical;
    _position = view.position;
    positionType = view.positionType ?? ViewPositionType.center;
    scrollController = view.scrollController ?? ScrollController();
    scrollingType = view.scrollingType ?? ViewScrollingType.none;
    shape = view.shape ?? ViewShape.rectangular;
    transform = view.transform;
    transformGravity = view.transformGravity;
    transform = view.transform;
    visible = view.visibility ?? true;
    child = view.child;

    /// Properties
    roots = view.initRootProperties();
    scrollable = view.scrollable ?? false;

    /// Value States
    backgroundState = view.backgroundState;
    backgroundImageState = view.backgroundImageState;
    backgroundGradientState = view.backgroundGradientState;

    /// VIEW LISTENER PROPERTIES
    onClick = view.onClick;
    onDoubleClick = view.onDoubleClick;
    onLongClick = view.onLongClick;
    onClickHandler = view.onClickHandler;
    onDoubleClickHandler = view.onDoubleClickHandler;
    onLongClickHandler = view.onLongClickHandler;
    onToggle = view.onToggle;

    /// VIEW DATA LISTENER PROPERTIES
    onChange = view.onChange;
    onError = view.onError;
    onHover = view.onHover;
    onValid = view.onValid;
    onValidator = view.onValidator;

    return this;
  }

  BuildContext? context;

  ViewRoots roots = const ViewRoots();

  ThemeData get theme => context != null ? Theme.of(context!) : ThemeData();

  bool expandable = false;
  bool scrollable = false;

  double elevation = 0;

  Color? _background;
  Color hoverColor = Colors.transparent;
  Color pressedColor = Colors.transparent;
  Color rippleColor = Colors.transparent;

  bool get isHovered => onHover != null || hoverColor != Colors.transparent;

  bool get isPressed => pressedColor != Colors.transparent;

  bool get isRippled => rippleColor != Colors.transparent;

  bool get isInkWellMode => !isBorder && (isHovered || isPressed || isRippled);

  BlendMode? backgroundBlendMode;
  Gradient? _backgroundGradient;
  DecorationImage? _backgroundImage;

  ValueState<Color>? backgroundState;
  ValueState<Gradient>? backgroundGradientState;
  ValueState<DecorationImage>? backgroundImageState;

  set background(Color? value) => _background = value;

  set backgroundGradient(Gradient? value) => _backgroundGradient = value;

  set backgroundImage(DecorationImage? value) => _backgroundImage = value;

  Color? get background {
    return backgroundState?.fromController(this) ?? _background;
  }

  Gradient? get backgroundGradient {
    return backgroundGradientState?.fromController(this) ?? _backgroundGradient;
  }

  DecorationImage? get backgroundImage {
    return backgroundImageState?.fromController(this) ?? _backgroundImage;
  }

  bool absorbMode = false;

  bool activated = false;

  Alignment? gravity;

  int animation = 0;

  bool get animationEnabled => animation > 0;

  Duration get animationDuration => Duration(microseconds: animation);

  Curve animationType = Curves.linear;

  Clip clipBehavior = Clip.antiAlias;

  double? _dimensionRatio;

  double get dimensionRatio => _dimensionRatio ?? 0;

  Color? foreground;

  Gradient? foregroundGradient;

  BlendMode? foregroundBlendMode;

  DecorationImage? foregroundImage;

  double? _borderSize;

  EdgeInsets get border {
    return EdgeInsets.only(
      left: borderStart ?? 0,
      right: borderEnd ?? 0,
      top: borderTop ?? 0,
      bottom: borderBottom ?? 0,
    );
  }

  double get borderAll {
    return border.left + border.right + border.top + border.bottom;
  }

  double? borderHorizontal, borderVertical;

  double? _borderTop;

  double? get borderTop => _borderTop ?? borderVertical ?? _borderSize;

  double? _borderBottom;

  double? get borderBottom => _borderBottom ?? borderVertical ?? _borderSize;

  double? _borderStart;

  double? get borderStart => _borderStart ?? borderHorizontal ?? _borderSize;

  double? _borderEnd;

  double? get borderEnd => _borderEnd ?? borderHorizontal ?? _borderSize;

  BoxBorder? get boxBorder => Border(
        top: BorderSide(
          color: borderColor ?? Colors.black,
          width: border.top,
        ),
        bottom: BorderSide(
          color: borderColor ?? Colors.black,
          width: border.bottom,
        ),
        left: BorderSide(
          color: borderColor ?? Colors.black,
          width: border.left,
        ),
        right: BorderSide(
          color: borderColor ?? Colors.black,
          width: border.right,
        ),
      );

  bool get isBorder => roots.border && borderAll > 0;

  bool get isBorderX => roots.border && (border.left + border.right) > 0;

  bool get isBorderY => roots.border && (border.top + border.bottom) > 0;

  Color? borderColor;

  Gradient? borderGradient;

  double? _borderRadius;

  BorderRadius get borderRadius {
    return BorderRadius.only(
      topLeft: Radius.circular(borderRadiusTL ?? 0),
      topRight: Radius.circular(borderRadiusTR ?? 0),
      bottomLeft: Radius.circular(borderRadiusBL ?? 0),
      bottomRight: Radius.circular(borderRadiusBR ?? 0),
    );
  }

  BorderRadius get borderRadiusF {
    return BorderRadius.only(
      topLeft: Radius.circular(borderRadiusTLF ?? 0),
      topRight: Radius.circular(borderRadiusTRF ?? 0),
      bottomLeft: Radius.circular(borderRadiusBLF ?? 0),
      bottomRight: Radius.circular(borderRadiusBRF ?? 0),
    );
  }

  double? _borderRadiusBL;

  double? get borderRadiusBL => _borderRadiusBL ?? _borderRadius;

  double? get borderRadiusBLF {
    final a = borderRadiusBL ?? 0;
    final b = a > 0 ? min(border.left, border.bottom) : 0;
    return a + b;
  }

  double? _borderRadiusBR;

  double? get borderRadiusBR => _borderRadiusBR ?? _borderRadius;

  double? get borderRadiusBRF {
    final a = borderRadiusBR ?? 0;
    final b = a > 0 ? min(border.right, border.bottom) : 0;
    return a + b;
  }

  double? _borderRadiusTL;

  double? get borderRadiusTL => _borderRadiusTL ?? _borderRadius;

  double? get borderRadiusTLF {
    final a = borderRadiusTL ?? 0;
    final b = a > 0 ? min(border.left, border.top) : 0;
    return a + b;
  }

  double? _borderRadiusTR;

  double? get borderRadiusTR => _borderRadiusTR ?? _borderRadius;

  double? get borderRadiusTRF {
    final a = borderRadiusTR ?? 0;
    final b = a > 0 ? min(border.right, border.top) : 0;
    return a + b;
  }

  bool get isRadius {
    var a = roots.radius;
    var b = !isCircular;
    var c = isBorderRadius;
    return a && b && c;
  }

  bool get isBorderRadius => roots.radius && borderRadius != BorderRadius.zero;

  Widget? child;

  bool enabled = true;

  bool error = false;

  int flex = 0;

  bool hover = false;

  /// width properties
  double? _width;

  ValueState<double>? widthState;

  double? get width => isSquire || isCircular
      ? maxSize
      : widthState?.fromController(this) ?? _width;

  double? _widthMax;

  double get widthMax => _widthMax ?? double.infinity;

  double? _widthMin;

  double get widthMin => _widthMin ?? 0.0;

  /// height properties
  double? _height;

  ValueState<double>? heightState;

  double? get height => isSquire || isCircular
      ? maxSize
      : heightState?.fromController(this) ?? _height;

  double? _heightMax;

  double get heightMax => _heightMax ?? double.infinity;

  double? _heightMin;

  double get heightMin => _heightMin ?? 0.0;

  /// margin properties
  double? _margin;

  EdgeInsets get margin {
    return EdgeInsets.only(
      left: marginStart ?? 0,
      right: marginEnd ?? 0,
      top: marginTop ?? 0,
      bottom: marginBottom ?? 0,
    );
  }

  double get marginAll {
    return margin.left + margin.right + margin.top + margin.bottom;
  }

  double? _marginStart;

  double? get marginStart => _marginStart ?? marginHorizontal ?? _margin;

  double? _marginEnd;

  double? get marginEnd => _marginEnd ?? marginHorizontal ?? _margin;

  double? _marginTop;

  double? get marginTop => _marginTop ?? marginVertical ?? _margin;

  double? _marginBottom;

  double? get marginBottom => _marginBottom ?? marginVertical ?? _margin;

  double? marginHorizontal;

  double? marginVertical;

  bool get isMargin => roots.margin && marginAll > 0;

  bool get isMarginX => roots.margin && (margin.left + margin.right) > 0;

  bool get isMarginY => roots.margin && (margin.top + margin.bottom) > 0;

  double? _padding;

  EdgeInsets? get padding {
    return paddingAll > 0
        ? EdgeInsets.only(
            left: paddingStart ?? 0,
            right: paddingEnd ?? 0,
            top: paddingTop ?? 0,
            bottom: paddingBottom ?? 0,
          )
        : null;
  }

  double get paddingAll {
    return (paddingStart ?? 0) +
        (paddingEnd ?? 0) +
        (paddingTop ?? 0) +
        (paddingBottom ?? 0);
  }

  double? _paddingStart;

  double? get paddingStart => _paddingStart ?? paddingHorizontal ?? _padding;

  double? _paddingEnd;

  double? get paddingEnd => _paddingEnd ?? paddingHorizontal ?? _padding;

  double? _paddingTop;

  double? get paddingTop => _paddingTop ?? paddingVertical ?? _padding;

  double? _paddingBottom;

  double? get paddingBottom => _paddingBottom ?? paddingVertical ?? _padding;

  double? paddingHorizontal;

  double? paddingVertical;

  bool get isPadding => roots.padding && paddingAll > 0;

  bool get isPaddingX {
    return roots.padding && ((paddingStart ?? 0) + (paddingEnd ?? 0)) > 0;
  }

  bool get isPaddingY {
    return roots.padding && ((paddingTop ?? 0) + (paddingBottom ?? 0)) > 0;
  }

  /// positional properties

  ViewPosition? _position;

  ViewPosition get position => _position ?? positionType.position;

  ViewPositionType positionType = ViewPositionType.center;

  /// scroll properties
  Axis orientation = Axis.vertical;

  ScrollController scrollController = ScrollController();

  ViewScrollingType scrollingType = ViewScrollingType.none;

  /// Shadow properties
  double shadow = 0;

  List<BoxShadow>? get shadows {
    return isShadow
        ? [
            BoxShadow(
              color: shadowColor ?? Colors.black12,
              blurRadius: shadowBlurRadius,
              offset: isOverlayShadow
                  ? Offset.zero
                  : Offset(-shadowStart, -shadowTop),
              blurStyle: shadowBlurStyle,
              spreadRadius: shadowSpreadRadius,
            ),
            if (!isOverlayShadow)
              BoxShadow(
                color: shadowColor ?? Colors.black12,
                blurRadius: shadowBlurRadius,
                offset: Offset(shadowEnd, shadowBottom),
                blurStyle: shadowBlurStyle,
                spreadRadius: shadowSpreadRadius,
              ),
          ]
        : null;
  }

  bool get isShadow {
    final x = shadowStart + shadowEnd + shadowTop + shadowBottom;
    return roots.shadow && (x > 0 || shadowType == ViewShadowType.overlay);
  }

  Color? shadowColor;

  double shadowBlurRadius = 5;

  BlurStyle shadowBlurStyle = BlurStyle.normal;

  double shadowSpreadRadius = 0;

  ViewShadowType shadowType = ViewShadowType.none;

  double? shadowHorizontal;

  double? shadowVertical;

  double? _shadowStart;

  double get shadowStart => _shadowStart ?? shadowHorizontal ?? shadow;

  double? _shadowEnd;

  double get shadowEnd => _shadowEnd ?? shadowHorizontal ?? shadow;

  double? _shadowTop;

  double get shadowTop => _shadowTop ?? shadowVertical ?? shadow;

  double? _shadowBottom;

  double get shadowBottom => _shadowBottom ?? shadowVertical ?? shadow;

  ViewShape shape = ViewShape.rectangular;

  Matrix4? transform;

  Alignment? transformGravity;

  /// default properties
  bool visible = true;

  /// custom properties
  bool get isCircular => roots.shape && shape == ViewShape.circular;

  bool get isConstraints =>
      roots.constraints &&
      (_widthMax != null ||
          _widthMin != null ||
          _heightMax != null ||
          _heightMin != null);

  bool get isDimensional => roots.ratio && dimensionRatio > 0;

  bool get isExpendable {
    return roots.flex && flex > 0;
  }

  bool get isHeight => height != null;

  bool get isOverlayShadow =>
      roots.shadow && shadowType == ViewShadowType.overlay;

  bool get isPositional {
    return roots.position &&
        (_position != null || positionType != ViewPositionType.center);
  }

  bool get isScrollable => roots.scrollable && scrollable;

  bool get isSquire {
    return shape == ViewShape.squire;
  }

  bool get isToggleClickable => onToggle != null || expandable;

  double get maxSize {
    return max(_width ?? 0, _height ?? 0);
  }

  double get minSize {
    return min(_width ?? 0, _height ?? 0);
  }

  /// Boolean properties
  void setAbsorbMode(bool value) {
    absorbMode = value;
    _notify;
  }

  void setActivated(bool value) {
    activated = value;
    _notify;
  }

  void setEnabled(bool value) {
    enabled = value;
    _notify;
  }

  void setError(bool value) {
    error = value;
    _notify;
  }

  void setHover(bool value) {
    hover = value;
    _notify;
  }

  void setVisibility(bool value) {
    visible = value;
    _notify;
  }

  /// Animation properties
  void setAnimation(int value) {
    animation = value;
    _notify;
  }

  void setAnimationType(Curve value) {
    animationType = value;
    _notify;
  }

  /// Base properties
  void setAlignment(Alignment? value) {
    gravity = value;
    _notify;
  }

  void setBackground(Color? value) {
    _background = value;
    _notify;
  }

  void setBackgroundState(ValueState<Color>? value) {
    backgroundState = value;
    _notify;
  }

  void setBackgroundGradient(Gradient? value) {
    _backgroundGradient = value;
    _notify;
  }

  void setBackgroundGradientState(ValueState<Gradient>? value) {
    backgroundGradientState = value;
    _notify;
  }

  void setBackgroundBlendMode(BlendMode? value) {
    backgroundBlendMode = value;
    _notify;
  }

  void setBackgroundImage(DecorationImage? value) {
    _backgroundImage = value;
    _notify;
  }

  void setBackgroundImageState(ValueState<DecorationImage>? value) {
    backgroundImageState = value;
    _notify;
  }

  void setBorderColor(Color value) {
    borderColor = value;
    _notify;
  }

  void setBorderGradient(Gradient? value) {
    borderGradient = value;
    _notify;
  }

  void setBorder(double value) {
    _borderSize = value;
    _notify;
  }

  void setBorderHorizontal(double? value) {
    borderHorizontal = value;
    _notify;
  }

  void setBorderVertical(double? value) {
    borderVertical = value;
    _notify;
  }

  void setBorderTop(double? value) {
    _borderTop = value;
    _notify;
  }

  void setBorderBottom(double? value) {
    _borderBottom = value;
    _notify;
  }

  void setBorderStart(double? value) {
    _borderStart = value;
    _notify;
  }

  void setBorderEnd(double? value) {
    _borderEnd = value;
    _notify;
  }

  void setBorderRadius(double value) {
    _borderRadius = value;
    _notify;
  }

  void setBorderRadiusBL(double? value) {
    _borderRadiusBL = value;
    _notify;
  }

  void setBorderRadiusBR(double? value) {
    _borderRadiusBR = value;
    _notify;
  }

  void setBorderRadiusTL(double? value) {
    _borderRadiusTL = value;
    _notify;
  }

  void setBorderRadiusTR(double? value) {
    _borderRadiusTR = value;
    _notify;
  }

  void setClipBehavior(Clip value) {
    clipBehavior = value;
    _notify;
  }

  void setDimensionRatio(double? value) {
    _dimensionRatio = value;
    _notify;
  }

  void setElevation(double value) {
    elevation = value;
    _notify;
  }

  void setForeground(Color? value) {
    foreground = value;
    _notify;
  }

  void setForegroundGradient(Gradient? value) {
    foregroundGradient = value;
    _notify;
  }

  void setForegroundBlendMode(BlendMode? value) {
    foregroundBlendMode = value;
    _notify;
  }

  void setForegroundImage(DecorationImage? value) {
    foregroundImage = value;
    _notify;
  }

  void setChild(Widget? value) {
    child = value;
    _notify;
  }

  void setFlex(int value) {
    flex = value;
    _notify;
  }

  void setWidth(double? value) {
    _width = value;
    _notify;
  }

  void setMaxWidth(double? value) {
    _widthMax = value;
    _notify;
  }

  void setMinWidth(double? value) {
    _widthMin = value;
    _notify;
  }

  void setHeight(double? value) {
    _height = value;
    _notify;
  }

  void setMaxHeight(double? value) {
    _heightMax = value;
    _notify;
  }

  void setMinHeight(double? value) {
    _heightMin = value;
    _notify;
  }

  void setMargin(double value) {
    _margin = value;
    _notify;
  }

  void setMarginStart(double? value) {
    _marginStart = value;
    _notify;
  }

  void setMarginEnd(double? value) {
    _marginEnd = value;
    _notify;
  }

  void setMarginTop(double? value) {
    _marginTop = value;
    _notify;
  }

  void setMarginBottom(double? value) {
    _marginBottom = value;
    _notify;
  }

  void setMarginHorizontal(double? value) {
    marginHorizontal = value;
    _notify;
  }

  void setMarginVertical(double? value) {
    marginVertical = value;
    _notify;
  }

  void setPadding(double value) {
    _padding = value;
    _notify;
  }

  void setPaddingStart(double? value) {
    _paddingStart = value;
    _notify;
  }

  void setPaddingEnd(double? value) {
    _paddingEnd = value;
    _notify;
  }

  void setPaddingTop(double? value) {
    _paddingTop = value;
    _notify;
  }

  void setPaddingBottom(double? value) {
    _paddingBottom = value;
    _notify;
  }

  void setPaddingHorizontal(double? value) {
    paddingHorizontal = value;
    _notify;
  }

  void setPaddingVertical(double? value) {
    paddingVertical = value;
    _notify;
  }

  void setPosition(ViewPosition? value) {
    _position = value;
    _notify;
  }

  void setPositionType(ViewPositionType value) {
    positionType = value;
    _notify;
  }

  void setTransform(Matrix4 value) {
    transform = value;
    _notify;
  }

  void setTransformAlignment(Alignment value) {
    transformGravity = value;
    _notify;
  }

  void setShadow(double value) {
    shadow = value;
    _notify;
  }

  void setShadowColor(Color value) {
    shadowColor = value;
    _notify;
  }

  void setShadowBlurRadius(double value) {
    shadowBlurRadius = value;
    _notify;
  }

  void setShadowBlurStyle(BlurStyle value) {
    shadowBlurStyle = value;
    _notify;
  }

  void setShadowSpreadRadius(double value) {
    shadowSpreadRadius = value;
    _notify;
  }

  void setShadowType(ViewShadowType value) {
    shadowType = value;
    _notify;
  }

  void setShadowHorizontal(double? value) {
    shadowHorizontal = value;
    _notify;
  }

  void setShadowVertical(double? value) {
    shadowVertical = value;
    _notify;
  }

  void setShadowStart(double? value) {
    _shadowStart = value;
    _notify;
  }

  void setShadowEnd(double? value) {
    _shadowEnd = value;
    _notify;
  }

  void setShadowTop(double? value) {
    _shadowTop = value;
    _notify;
  }

  void setShadowBottom(double? value) {
    _shadowBottom = value;
    _notify;
  }

  void setViewShape(ViewShape value) {
    shape = value;
    _notify;
  }

  /// observable properties
  bool get isClickable =>
      onClick != null || onClickHandler != null || isToggleClickable;

  bool get isDoubleClickable =>
      onDoubleClick != null || onDoubleClickHandler != null;

  bool get isLongClickable => onLongClick != null || onLongClickHandler != null;

  bool get isObservable =>
      roots.observer &&
      (isClickable || isDoubleClickable || isLongClickable || isInkWellMode);

  OnViewClickListener? _onClick;

  OnViewClickListener? get onClick => enabled ? _onClick : null;

  set onClick(OnViewClickListener? listener) => _onClick ??= listener;

  OnViewClickListener? _onDoubleClick;

  OnViewClickListener? get onDoubleClick => enabled ? _onDoubleClick : null;

  set onDoubleClick(OnViewClickListener? listener) =>
      _onDoubleClick ??= listener;

  OnViewClickListener? _onLongClick;

  OnViewClickListener? get onLongClick => enabled ? _onLongClick : null;

  set onLongClick(OnViewClickListener? listener) => _onLongClick ??= listener;

  OnViewToggleListener? _onToggleClick;

  OnViewToggleListener? get onToggle => enabled ? _onToggleClick : null;

  set onToggle(OnViewToggleListener? listener) => _onToggleClick ??= listener;

  OnViewChangeListener? _onChange;

  OnViewChangeListener? get onChange => enabled ? _onChange : null;

  set onChange(OnViewChangeListener? listener) => _onChange ??= listener;

  OnViewHoverListener? _onHover;

  OnViewHoverListener? get onHover => enabled ? _onHover : null;

  set onHover(OnViewHoverListener? listener) => _onHover ??= listener;

  OnViewErrorListener? _onError;

  OnViewErrorListener? get onError => enabled ? _onError : null;

  set onError(OnViewErrorListener? listener) => _onError ??= listener;

  OnViewValidListener? _onValid;

  OnViewValidListener? get onValid => enabled ? _onValid : null;

  set onValid(OnViewValidListener? listener) => _onValid ??= listener;

  OnViewValidatorListener? _onValidator;

  OnViewValidatorListener? get onValidator => enabled ? _onValidator : null;

  set onValidator(OnViewValidatorListener? listener) =>
      _onValidator ??= listener;

  OnViewNotifyListener? onClickHandler,
      onDoubleClickHandler,
      onLongClickHandler;

  void setOnClickListener(OnViewClickListener listener) => _onClick = listener;

  void setOnDoubleClickListener(OnViewClickListener listener) =>
      _onDoubleClick = listener;

  void setOnLongClickListener(OnViewClickListener listener) =>
      _onLongClick = listener;

  void setOnToggleClickListener(OnViewToggleListener listener) =>
      _onToggleClick = listener;

  void setOnChangeListener(OnViewChangeListener listener) =>
      _onChange = listener;

  void setOnHoverListener(OnViewHoverListener listener) => _onHover = listener;

  void setOnErrorListener(OnViewErrorListener listener) => _onError = listener;

  void setOnValidListener(OnViewValidListener listener) => _onValid = listener;

  void setOnValidatorListener(OnViewValidatorListener listener) =>
      _onValidator = listener;

  /// notifier properties

  OnViewNotifier? _notifier;

  void get _notify {
    if (_notifier != null) {
      _notifier?.call(() {});
    }
  }

  void _setNotifier(OnViewNotifier? notifier) => _notifier = notifier;

  void onNotify() => _notify;

  void onNotifyWithCallback(VoidCallback callback) {
    if (_notifier != null) {
      _notifier?.call(callback);
    }
  }

  void onNotifyHover(bool status) {
    hover = status;
    onHover?.call(hover);
    _notify;
  }

  void onNotifyToggle() {
    activated = !activated;
    onToggle?.call(activated);
    _notify;
  }
}

class YMRView<T extends ViewController> extends StatefulWidget {
  final T? controller;

  final int? flex;
  final bool? absorbMode, activated, enabled, expandable, scrollable;

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

  final double? border;
  final double? borderHorizontal, borderVertical;
  final double? borderTop, borderBottom, borderStart, borderEnd;

  final double? borderRadius;
  final double? borderRadiusBL, borderRadiusBR, borderRadiusTL, borderRadiusTR;

  final double? shadow;
  final double? shadowBlurRadius, shadowSpreadRadius;
  final double? shadowHorizontal, shadowVertical;
  final double? shadowStart, shadowEnd, shadowTop, shadowBottom;

  final Color? background, borderColor, foreground, shadowColor;
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
    this.flex,
    this.absorbMode,
    this.activated,
    this.enabled,
    this.expandable,
    this.visibility,
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
    this.border,
    this.borderHorizontal,
    this.borderVertical,
    this.borderTop,
    this.borderBottom,
    this.borderStart,
    this.borderEnd,
    this.borderRadius,
    this.borderRadiusBL,
    this.borderRadiusBR,
    this.borderRadiusTL,
    this.borderRadiusTR,
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
    this.borderColor,
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
    controller._setNotifier(setState);
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
    return controller.visible
        ? widget.root(
            context,
            controller,
            _ViewPosition(
              controller: controller,
              attachView: _ViewFlex(
                controller: controller,
                attachView: _ViewDimension(
                  controller: controller,
                  attachView: _ViewListener(
                    controller: controller,
                    attachView: _ViewBuilder(
                      controller: controller,
                      attach: widget.attach(context, controller),
                      builder: widget.build,
                    ),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}

class _ViewPosition extends StatelessWidget {
  final ViewController controller;
  final Widget attachView;

  const _ViewPosition({
    Key? key,
    required this.controller,
    required this.attachView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.isPositional
        ? Positioned(
            top: controller.position.top,
            bottom: controller.position.bottom,
            left: controller.position.left,
            right: controller.position.right,
            child: attachView,
          )
        : attachView;
  }
}

class _ViewFlex extends StatelessWidget {
  final ViewController controller;
  final Widget attachView;

  const _ViewFlex({
    Key? key,
    required this.controller,
    required this.attachView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.isExpendable
        ? Expanded(
            flex: controller.flex,
            child: attachView,
          )
        : attachView;
  }
}

class _ViewDimension extends StatelessWidget {
  final ViewController controller;
  final Widget attachView;

  const _ViewDimension({
    Key? key,
    required this.controller,
    required this.attachView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.isDimensional
        ? AspectRatio(
            aspectRatio: controller.dimensionRatio,
            child: attachView,
          )
        : attachView;
  }
}

class _ViewListener<T extends ViewController> extends StatelessWidget {
  final T controller;
  final Widget attachView;

  const _ViewListener({
    Key? key,
    required this.controller,
    required this.attachView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.isObservable) {
      if (controller.isInkWellMode) {
        return Padding(
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
              child: controller.absorbMode
                  ? AbsorbPointer(child: attachView)
                  : attachView,
            ),
          ),
        );
      } else {
        return GestureDetector(
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
          child: controller.absorbMode
              ? AbsorbPointer(child: attachView)
              : attachView,
        );
      }
    } else {
      return attachView;
    }
  }
}

class _ViewBuilder<T extends ViewController> extends StatelessWidget {
  final T controller;
  final Widget? attach;
  final OnViewModifyBuilder<T> builder;

  const _ViewBuilder({
    required this.controller,
    required this.attach,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final root = controller.roots;
    final isCircular = controller.isCircular;
    final isRadius = controller.isBorderRadius;
    final isRippleMode = controller.isInkWellMode;
    final isMargin = controller.isMargin;
    final isConstraints = controller.isConstraints;

    final borderRadius = !isRippleMode && isRadius && !isCircular
        ? controller.borderRadius
        : null;

    var child = controller.roots.view
        ? Container(
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
            child: controller.isScrollable
                ? SingleChildScrollView(
                    controller: controller.scrollController,
                    physics: controller.scrollingType.physics,
                    scrollDirection: controller.orientation,
                    padding: controller.padding,
                    child: attach,
                  )
                : attach,
          )
        : const SizedBox();

    return controller.visible
        ? builder(context, controller, child)
        : const SizedBox();
  }
}
