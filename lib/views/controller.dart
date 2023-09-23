part of '../widgets.dart';

class ViewController {
  @mustCallSuper
  ViewController fromView(YMRView view) {
    /// VIEW BORDER PROPERTIES
    _borderColor = view.borderColor;
    _borderSize = view.borderSize;
    _borderStart = view.borderStart;
    _borderEnd = view.borderEnd;
    _borderTop = view.borderTop;
    _borderBottom = view.borderBottom;
    _borderHorizontal = view.borderHorizontal;
    _borderVertical = view.borderVertical;
    borderColorState = view.borderColorState;
    borderSizeState = view.borderSizeState;
    borderStartState = view.borderStartState;
    borderEndState = view.borderEndState;
    borderTopState = view.borderTopState;
    borderBottomState = view.borderBottomState;
    borderHorizontalState = view.borderHorizontalState;
    borderVerticalState = view.borderVerticalState;

    /// VIEW BORDER RADIUS PROPERTIES
    _borderRadiusAll = view.borderRadius;
    _borderRadiusBL = view.borderRadiusBL;
    _borderRadiusBR = view.borderRadiusBR;
    _borderRadiusTL = view.borderRadiusTL;
    _borderRadiusTR = view.borderRadiusTR;
    borderRadiusAllState = view.borderRadiusState;
    borderRadiusBLState = view.borderRadiusBLState;
    borderRadiusBRState = view.borderRadiusBRState;
    borderRadiusTLState = view.borderRadiusTLState;
    borderRadiusTRState = view.borderRadiusTRState;

    /// INDICATOR AND ACTIVATOR PROPERTIES
    onActivator = view.onActivator;

    ///
    ///
    ///
    ///
    ///
    hoverColor = view.hoverColor;
    pressedColor = view.pressedColor;
    rippleColor = view.rippleColor;

    /// VIEW CONDITIONAL PROPERTIES
    absorbMode = view.absorbMode ?? false;
    activated = view.activated ?? false;
    enabled = view.enabled ?? true;
    expandable = view.expandable ?? false;
    scrollable = view.scrollable ?? false;
    visible = view.visibility ?? true;
    wrapper = view.wrapper ?? false;

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
    marginValue = view.margin ?? 0;
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
    child = view.child;

    /// Properties
    roots = view.initRootProperties();

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

  /// BORDER PROPERTIES

  Color? _borderColor;

  ValueState<Color>? borderColorState;

  double? _borderSize;

  ValueState<double>? borderSizeState;

  double? _borderHorizontal;

  ValueState<double>? borderHorizontalState;

  double? _borderVertical;

  ValueState<double>? borderVerticalState;

  double? _borderTop;

  ValueState<double>? borderTopState;

  double? _borderBottom;

  ValueState<double>? borderBottomState;

  double? _borderStart;

  ValueState<double>? borderStartState;

  double? _borderEnd;

  ValueState<double>? borderEndState;

  Color? get borderColor {
    return borderColorState?.fromController(this) ?? _borderColor;
  }

  double? get borderSize {
    return borderSizeState?.fromController(this) ?? _borderSize;
  }

  double? get borderHorizontal {
    var v = borderHorizontalState?.fromController(this) ?? _borderHorizontal;
    return v ?? borderSize;
  }

  double? get borderVertical {
    var v = borderVerticalState?.fromController(this) ?? _borderVertical;
    return v ?? borderSize;
  }

  double? get borderTop {
    var v = borderTopState?.fromController(this) ?? _borderTop;
    return v ?? borderVertical ?? borderSize;
  }

  double? get borderBottom {
    var v = borderBottomState?.fromController(this) ?? _borderBottom;
    return v ?? borderVertical ?? borderSize;
  }

  double? get borderStart {
    var v = borderStartState?.fromController(this) ?? _borderStart;
    return v ?? borderHorizontal ?? borderSize;
  }

  double? get borderEnd {
    var v = borderEndState?.fromController(this) ?? _borderEnd;
    return v ?? borderHorizontal ?? borderSize;
  }

  double get borderAll {
    return border.left + border.right + border.top + border.bottom;
  }

  EdgeInsets get border {
    return EdgeInsets.only(
      left: borderStart ?? 0,
      right: borderEnd ?? 0,
      top: borderTop ?? 0,
      bottom: borderBottom ?? 0,
    );
  }

  BoxBorder? get boxBorder {
    return Border(
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
  }

  bool get isBorder => roots.border && borderAll > 0;

  bool get isBorderX => roots.border && (border.left + border.right) > 0;

  bool get isBorderY => roots.border && (border.top + border.bottom) > 0;

  set borderColor(Color? value) => _borderColor = value;

  set borderSize(double? value) => _borderSize = value;

  set borderHorizontal(double? value) => _borderHorizontal = value;

  set borderVertical(double? value) => _borderVertical = value;

  set borderTop(double? value) => _borderTop = value;

  set borderBottom(double? value) => _borderBottom = value;

  set borderStart(double? value) => _borderStart = value;

  set borderEnd(double? value) => _borderEnd = value;

  void setBorderColor(Color? value) {
    onNotifyWithCallback(() => _borderColor = value);
  }

  void setBorderColorState(ValueState<Color>? value) {
    onNotifyWithCallback(() => borderColorState = value);
  }

  void setBorderSize(double value) {
    onNotifyWithCallback(() => _borderSize = value);
  }

  void setBorderSizeState(ValueState<double>? value) {
    onNotifyWithCallback(() => borderSizeState = value);
  }

  void setBorderHorizontal(double? value) {
    onNotifyWithCallback(() => _borderHorizontal = value);
  }

  void setBorderHorizontalState(ValueState<double>? value) {
    onNotifyWithCallback(() => borderHorizontalState = value);
  }

  void setBorderVerticalState(ValueState<double>? value) {
    onNotifyWithCallback(() => borderVerticalState = value);
  }

  void setBorderTop(double? value) {
    onNotifyWithCallback(() => _borderTop = value);
  }

  void setBorderTopState(ValueState<double>? value) {
    onNotifyWithCallback(() => borderTopState = value);
  }

  void setBorderBottom(double? value) {
    onNotifyWithCallback(() => _borderBottom = value);
  }

  void setBorderBottomState(ValueState<double>? value) {
    onNotifyWithCallback(() => borderBottomState = value);
  }

  void setBorderStart(double? value) {
    onNotifyWithCallback(() => _borderStart = value);
  }

  void setBorderStartState(ValueState<double>? value) {
    onNotifyWithCallback(() => borderStartState = value);
  }

  void setBorderEnd(double? value) {
    onNotifyWithCallback(() => _borderEnd = value);
  }

  void setBorderEndState(ValueState<double>? value) {
    onNotifyWithCallback(() => borderEndState = value);
  }

  /// BORDER RADIUS PROPERTIES

  double? _borderRadiusAll;

  ValueState<double>? borderRadiusAllState;

  double? _borderRadiusBL;

  ValueState<double>? borderRadiusBLState;

  double? _borderRadiusBR;

  ValueState<double>? borderRadiusBRState;

  double? _borderRadiusTL;

  ValueState<double>? borderRadiusTLState;

  double? _borderRadiusTR;

  ValueState<double>? borderRadiusTRState;

  double? get borderRadiusAll {
    return borderRadiusAllState?.fromController(this) ?? _borderRadiusAll;
  }

  double? get borderRadiusBL {
    var v = borderRadiusBLState?.fromController(this) ?? _borderRadiusBL;
    return v ?? borderRadiusAll;
  }

  double? get borderRadiusBR {
    var v = borderRadiusBRState?.fromController(this) ?? _borderRadiusBR;
    return v ?? borderRadiusAll;
  }

  double? get borderRadiusTL {
    var v = borderRadiusTLState?.fromController(this) ?? _borderRadiusTL;
    return v ?? borderRadiusAll;
  }

  double? get borderRadiusTR {
    var v = borderRadiusTRState?.fromController(this) ?? _borderRadiusTR;
    return v ?? borderRadiusAll;
  }

  BorderRadius get borderRadius {
    return BorderRadius.only(
      topLeft: Radius.circular(borderRadiusTL ?? 0),
      topRight: Radius.circular(borderRadiusTR ?? 0),
      bottomLeft: Radius.circular(borderRadiusBL ?? 0),
      bottomRight: Radius.circular(borderRadiusBR ?? 0),
    );
  }

  bool get isRadius {
    var a = roots.radius;
    var b = !isCircular;
    var c = isBorderRadius;
    return a && b && c;
  }

  bool get isBorderRadius => roots.radius && borderRadius != BorderRadius.zero;

  set borderRadiusAll(double? value) => _borderRadiusAll = value;

  set borderRadiusBL(double? value) => _borderRadiusBL = value;

  set borderRadiusBR(double? value) => _borderRadiusBR = value;

  set borderRadiusTL(double? value) => _borderRadiusTL = value;

  set borderRadiusTR(double? value) => _borderRadiusTR = value;

  void setBorderRadiusAll(double? value) {
    onNotifyWithCallback(() => _borderRadiusAll = value);
  }

  void setBorderRadiusAllState(ValueState<double>? value) {
    onNotifyWithCallback(() => borderRadiusAllState = value);
  }

  void setBorderRadiusBL(double? value) {
    onNotifyWithCallback(() => _borderRadiusBL = value);
  }

  void setBorderRadiusBLState(ValueState<double>? value) {
    onNotifyWithCallback(() => borderRadiusBLState = value);
  }

  void setBorderRadiusBR(double? value) {
    onNotifyWithCallback(() => _borderRadiusBR = value);
  }

  void setBorderRadiusBRState(ValueState<double>? value) {
    onNotifyWithCallback(() => borderRadiusBRState = value);
  }

  void setBorderRadiusTL(double? value) {
    onNotifyWithCallback(() => _borderRadiusTL = value);
  }

  void setBorderRadiusTLState(ValueState<double>? value) {
    onNotifyWithCallback(() => borderRadiusTLState = value);
  }

  void setBorderRadiusTR(double? value) {
    onNotifyWithCallback(() => _borderRadiusTR = value);
  }

  void setBorderRadiusTRState(ValueState<double>? value) {
    onNotifyWithCallback(() => borderRadiusTRState = value);
  }

  /// INDICATOR AND ACTIVATOR PROPERTIES

  bool _loading = false;

  bool get isIndicatorVisible => onActivator != null && _loading;

  OnViewActivator? _onActivator;

  OnViewActivator? get onActivator => enabled ? _onActivator : null;

  set onActivator(OnViewActivator? value) => _onActivator ??= value;

  void setOnActivatorListener(OnViewActivator listener) =>
      _onActivator = listener;

  void onNotifyActivator(dynamic data, {VoidCallback? callback}) async {
    if (onActivator != null) {
      onNotifyWithCallback(() => _loading = true);
      bool value = await onActivator!(data);
      onNotifyWithCallback(() {
        activated = value;
        _loading = false;
      });
    } else {
      if (callback != null) callback();
    }
  }

  void onNotifyToggleWithActivator() {
    onNotifyActivator(!activated, callback: onNotifyToggle);
  }

  ///
  ///
  ///
  ///
  ///
  bool expandable = false;
  bool scrollable = false;
  bool wrapper = false;

  double elevation = 0;

  Color? _background;
  Color hoverColor = Colors.transparent;
  Color pressedColor = Colors.transparent;
  Color rippleColor = Colors.transparent;

  bool get isHovered => onHover != null || hoverColor != Colors.transparent;

  bool get isWrapper => roots.wrapper && wrapper;

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

  /// CHILD PROPERTIES
  Widget? child;

  bool enabled = true;

  bool error = false;

  int flex = 0;

  bool hover = false;

  /// width properties
  double? _width;

  ValueState<double>? widthState;

  set width(double? value) => _width = value;

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

  set height(double? value) => _height = value;

  double? get height => isSquire || isCircular
      ? maxSize
      : heightState?.fromController(this) ?? _height;

  double? _heightMax;

  double get heightMax => _heightMax ?? double.infinity;

  double? _heightMin;

  double get heightMin => _heightMin ?? 0.0;

  /// margin properties
  double? marginValue;

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

  double? get marginStart => _marginStart ?? marginHorizontal ?? marginValue;

  double? _marginEnd;

  double? get marginEnd => _marginEnd ?? marginHorizontal ?? marginValue;

  double? _marginTop;

  double? get marginTop => _marginTop ?? marginVertical ?? marginValue;

  double? _marginBottom;

  double? get marginBottom => _marginBottom ?? marginVertical ?? marginValue;

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

  bool get isToggleClickable {
    return onToggle != null || onActivator != null || expandable;
  }

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
    marginValue = value;
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

  void setNotifier(OnViewNotifier? notifier) => _notifier = notifier;

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

  void onNotifyWrapper(Size size) {
    width = size.width;
    height = size.height;
    _notify;
  }

  void onNotifyToggle() {
    activated = !activated;
    onToggle?.call(activated);
    _notify;
  }
}

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

class ViewCornerRadius {
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  const ViewCornerRadius({
    this.topLeft = 0,
    this.topRight = 0,
    this.bottomLeft = 0,
    this.bottomRight = 0,
  });

  const ViewCornerRadius.all(double value)
      : topLeft = value,
        topRight = value,
        bottomLeft = value,
        bottomRight = value;

  const ViewCornerRadius.topAll(double value)
      : topLeft = value,
        topRight = value,
        bottomLeft = 0,
        bottomRight = 0;

  const ViewCornerRadius.bottomAll(double value)
      : topLeft = 0,
        topRight = 0,
        bottomLeft = value,
        bottomRight = value;

  const ViewCornerRadius.leftAll(double value)
      : topLeft = value,
        topRight = 0,
        bottomLeft = value,
        bottomRight = 0;

  const ViewCornerRadius.rightAll(double value)
      : topLeft = 0,
        topRight = value,
        bottomLeft = 0,
        bottomRight = value;

  double get all {
    var radius = topLeft;
    if (radius < topRight) {
      radius = topRight;
    }
    if (radius < bottomLeft) {
      radius = bottomLeft;
    }
    if (radius < bottomRight) {
      radius = bottomRight;
    }
    return radius;
  }

  double get average => (topLeft + topRight + bottomLeft + bottomRight) / 4;
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
  final bool position, flex, ratio, observer, wrapper;
  final bool view, constraints, margin, padding;
  final bool decoration, shadow, shape, radius, border, background;

  const ViewRoots({
    this.scrollable = true,
    this.position = true,
    this.flex = true,
    this.ratio = true,
    this.observer = true,
    this.view = true,
    this.wrapper = true,
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

class ViewToggleContent<T> {
  final T active;
  final T inactive;

  const ViewToggleContent({
    required this.active,
    T? inactive,
  }) : inactive = inactive ?? active;

  T detect(bool isActivated) => isActivated ? active : inactive;
}
