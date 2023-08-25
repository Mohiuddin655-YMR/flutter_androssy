part of '../widgets.dart';

class SplashView extends YMRView<SplashViewController> {
  final int duration;
  final String? title, subtitle;
  final Color? titleColor, subtitleColor;
  final double titleExtraSize, subtitleExtraSize;
  final double? titleSize, subtitleSize;
  final TextStyle titleStyle;
  final TextStyle? subtitleStyle;
  final FontWeight? titleWeight, subtitleWeight;
  final double titleSpacing, subtitleSpacing;
  final String? logo;
  final double? logoRadius;
  final double? logoSize;

  final Future Function()? onExecute;
  final Function(BuildContext context)? onRoute;

  final Widget? body;
  final double bodyX;
  final double bodyY;
  final Widget? bottom;

  const SplashView({
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
    this.body,
    this.bodyX = 0,
    this.bodyY = 0,
    this.bottom,
    this.duration = 5000,
    this.onRoute,
    this.onExecute,
    this.title,
    this.subtitle,
    this.titleColor,
    this.subtitleColor,
    this.titleExtraSize = 1,
    this.subtitleExtraSize = 1,
    this.titleSize = 20,
    this.subtitleSize,
    this.titleSpacing = 24,
    this.subtitleSpacing = 8,
    this.titleStyle = const TextStyle(),
    this.subtitleStyle,
    this.titleWeight = FontWeight.bold,
    this.subtitleWeight,
    this.logo,
    this.logoRadius,
    this.logoSize,
  });

  @override
  SplashViewController initController() => SplashViewController();

  @override
  SplashViewController attachController(SplashViewController controller) {
    return controller.fromSplashView(this);
  }

  @override
  Widget? attach(BuildContext context, SplashViewController controller) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AxisView(
            x: bodyX,
            y: bodyY,
            child: body ??
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageView(
                      image: logo,
                      scaleType: BoxFit.cover,
                      width: logoSize,
                      shape: ViewShape.squire,
                    ),
                    TextView(
                      visibility: (title ?? "").isNotEmpty,
                      marginTop: titleSpacing,
                      text: title,
                      textAlign: TextAlign.center,
                      textColor: titleColor,
                      textSize: titleSize,
                      textFontWeight: titleWeight,
                    ),
                    TextView(
                      visibility: (subtitle ?? "").isNotEmpty,
                      marginTop: subtitleSpacing,
                      text: subtitle,
                      textAlign: TextAlign.center,
                      textColor: subtitleColor ?? Colors.grey,
                      textSize: subtitleSize ?? titleSize.x50,
                      textFontWeight: subtitleWeight,
                    ),
                  ],
                ),
          ),
          Positioned(
            bottom: 0,
            child: bottom ?? const SizedBox(),
          ),
        ],
      ),
    );
  }

  @override
  void onInit(SplashViewController controller) {
    Timer(Duration(milliseconds: duration), () {
      if (onExecute != null) {
        onExecute?.call().whenComplete(() {
          return onRoute?.call(controller.context!);
        });
      } else {
        onRoute?.call(controller.context!);
      }
    });
  }
}

class SplashViewController extends ViewController {
  SplashViewController fromSplashView(SplashView view) {
    super.fromView(view);
    return this;
  }
}
