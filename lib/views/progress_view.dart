part of '../widgets.dart';

class ProgressView extends YMRView<ProgressViewController> {
  final Color? progressBackground;
  final Color? progressForeground;
  final double progressStrokeWidth;

  const ProgressView({
    /// BASE PROPERTIES
    super.key,
    super.controller,

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

    ///
    ///
    ///
    ///
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
    super.clipBehavior,
    super.dimensionRatio,
    super.elevation,
    super.enabled,
    super.foreground,
    super.foregroundBlendMode,
    super.foregroundGradient,
    super.foregroundImage,
    super.gravity,
    super.height,
    super.heightMax,
    super.heightMin,
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
    this.progressBackground,
    this.progressForeground,
    this.progressStrokeWidth = 4,
  });

  @override
  ProgressViewController initController() => ProgressViewController();

  @override
  ProgressViewController attachController(ProgressViewController controller) {
    return controller.fromLoadingView(this);
  }

  @override
  Widget? attach(BuildContext context, ProgressViewController controller) {
    return CircularProgressIndicator(
      backgroundColor: controller.progressBackground,
      color: controller.progressForeground ?? context.primaryColor,
      strokeWidth: controller.progressStrokeWidth,
    );
  }
}

class ProgressViewController extends ViewController {
  Color? progressBackground;
  Color? progressForeground;
  double progressStrokeWidth = 4;

  ProgressViewController fromLoadingView(ProgressView view) {
    super.fromView(view);
    progressBackground = view.progressBackground;
    progressForeground = view.progressForeground;
    progressStrokeWidth = view.progressStrokeWidth;
    return this;
  }

  void show() {
    if (!visible) setVisibility(true);
  }

  void hide() {
    if (visible) setVisibility(false);
  }
}
