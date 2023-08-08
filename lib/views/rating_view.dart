part of '../widgets.dart';

enum RatingViewType {
  none,
  indicator,
}

class RatingView extends YMRView<RatingViewController> {
  /// BASE PROPERTIES
  final bool allowHalfRating;
  final bool draggable;
  final bool ignoreGestures;
  final double initialRating;
  final int itemCount;
  final EdgeInsets itemPadding;
  final double itemSize;
  final bool glow;
  final Color? glowColor;
  final double glowRadius;
  final double maxRating;
  final double minRating;
  final Color? ratingColor;
  final ValueState<Color>? ratingColorState;
  final dynamic ratingIcon;
  final ValueState<dynamic>? ratingIconState;
  final ScrollPhysics ratingPhysics;
  final bool tapMode;
  final TextDirection textDirection;
  final RatingViewType type;
  final Color? unratedColor;
  final WrapAlignment wrapAlignment;
  final OnViewChangeListener<double>? onRatingChange;

  const RatingView({
    /// SUPER PROPERTIES
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
    super.expandable,
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
    super.orientation = Axis.horizontal,
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
    super.scrollController,
    super.scrollingType,
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

    /// BASE PROPERTIES
    this.allowHalfRating = false,
    this.draggable = false,
    this.ignoreGestures = false,
    this.initialRating = 0,
    this.itemCount = 5,
    this.itemPadding = EdgeInsets.zero,
    this.itemSize = 24,
    this.glow = false,
    this.glowColor,
    this.glowRadius = 2,
    this.maxRating = 5,
    this.minRating = 0,
    this.ratingColor,
    this.ratingColorState,
    this.ratingIcon,
    this.ratingIconState,
    this.ratingPhysics = const NeverScrollableScrollPhysics(),
    this.tapMode = false,
    this.textDirection = TextDirection.ltr,
    this.type = RatingViewType.none,
    this.unratedColor,
    this.wrapAlignment = WrapAlignment.start,
    this.onRatingChange,
  });

  @override
  RatingViewController initController() => RatingViewController();

  @override
  RatingViewController attachController(RatingViewController controller) {
    return controller.fromRatingView(this);
  }

  @override
  Widget? attach(BuildContext context, RatingViewController controller) {
    var mRC = controller.ratedColor ?? context.primaryColor;
    var mUC = controller.ratedColor ?? context.primaryColor.withAlpha(50);
    if (type == RatingViewType.indicator) {
      return RatingIndicator(
        direction: controller.orientation,
        itemCount: controller.itemCount,
        itemPadding: controller.itemPadding,
        itemSize: controller.itemSize,
        physics: controller.ratingPhysics,
        rating: controller.initialRating,
        textDirection: controller.textDirection,
        unratedColor: controller.unratedColor ?? mUC,
        itemBuilder: (context, rating) {
          return RawIconView(
            icon: controller.ratedIcon ?? Icons.star,
            tint: controller.ratedColor ?? mRC,
          );
        },
      );
    } else {
      return RawRatingView(
        allowHalfRating: controller.allowHalfRating,
        direction: controller.orientation,
        ignoreGestures: controller.ignoreGestures,
        initialRating: controller.initialRating,
        itemCount: controller.itemCount,
        itemPadding: controller.itemPadding,
        itemSize: controller.itemSize,
        glow: controller.glow,
        glowColor: controller.glowColor,
        glowRadius: controller.glowRadius,
        maxRating: controller.maxRating,
        minRating: controller.minRating,
        tapOnlyMode: controller.tapMode,
        textDirection: controller.textDirection,
        unratedColor: controller.unratedColor ?? mUC,
        updateOnDrag: controller.draggable,
        wrapAlignment: controller.wrapAlignment,
        ratingIcon: RatingIcon(
          full: RawIconView(
            icon: controller.ratedIcon ?? Icons.star,
            tint: controller.ratedColor ?? mRC,
          ),
          half: RawIconView(
            icon: controller.halfRatedIcon ?? Icons.star_half,
            tint: controller.halfRatedColor ?? mRC.withOpacity(0.75),
          ),
          empty: RawIconView(
            icon: controller.unratedIcon ?? Icons.star_outline,
            tint: controller.unratedColor ?? mRC.withOpacity(0.5),
          ),
        ),
        onRatingChange: controller.onRatingChange,
      );
    }
  }
}

class RatingViewController extends ViewController {
  RatingViewController fromRatingView(RatingView view) {
    super.fromView(view);

    /// BASE PROPERTIES
    allowHalfRating = view.allowHalfRating;
    draggable = view.draggable;
    ignoreGestures = view.ignoreGestures;
    initialRating = view.initialRating;
    itemCount = view.itemCount;
    itemPadding = view.itemPadding;
    itemSize = view.itemSize;
    glow = view.glow;
    glowColor = view.glowColor;
    glowRadius = view.glowRadius;
    maxRating = view.maxRating;
    minRating = view.minRating;
    ratingColor = view.ratingColor;
    ratingColorState = view.ratingColorState;
    ratingIcon = view.ratingIcon;
    ratingIconState = view.ratingIconState;
    ratingPhysics = view.ratingPhysics;
    tapMode = view.tapMode;
    textDirection = view.textDirection;
    type = view.type;
    _unratedColor = view.unratedColor;
    wrapAlignment = view.wrapAlignment;

    /// CALLBACKS
    onRatingChange = view.onRatingChange;
    return this;
  }

  /// CUSTOMIZATIONS
  double currentRating = 0.0;

  void setRating(double rating) {
    onNotifyWithCallback(() => currentRating = rating);
  }

  /// BASE PROPERTIES
  bool allowHalfRating = false;
  bool draggable = false;
  bool ignoreGestures = false;
  double initialRating = 3;
  int itemCount = 5;
  EdgeInsets itemPadding = EdgeInsets.zero;
  double itemSize = 24;
  bool glow = false;
  Color? glowColor;
  double glowRadius = 2;
  double maxRating = 5;
  double minRating = 0;
  Color? ratingColor;
  ValueState<Color>? ratingColorState;
  dynamic ratingIcon;
  ValueState<dynamic>? ratingIconState;
  ScrollPhysics ratingPhysics = const NeverScrollableScrollPhysics();
  bool tapMode = false;
  TextDirection textDirection = TextDirection.ltr;
  RatingViewType type = RatingViewType.none;
  Color? _unratedColor;
  WrapAlignment wrapAlignment = WrapAlignment.start;

  dynamic get ratedIcon => ratingIconState?.primary ?? ratingIcon;

  dynamic get unratedIcon => ratingIconState?.secondary ?? ratingIcon;

  dynamic get halfRatedIcon => ratingIconState?.ternary ?? ratingIcon;

  Color? get ratedColor => ratingColorState?.primary ?? ratingColor;

  Color? get unratedColor {
    return ratingColorState?.secondary ?? _unratedColor ?? ratingColor;
  }

  dynamic get halfRatedColor => ratingColorState?.ternary ?? ratingIcon;

  /// CALLBACKS
  OnViewChangeListener<double>? _onRatingChange;

  OnViewChangeListener<double>? get onRatingChange =>
      enabled ? _onRatingChange : null;

  set onRatingChange(OnViewChangeListener<double>? listener) =>
      _onRatingChange ??= listener;

  void setOnUpdateRatingListener(OnViewChangeListener<double>? listener) {
    _onRatingChange = listener;
  }
}
