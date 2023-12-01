part of '../widgets.dart';

typedef SplashViewOnExecuteListener = Future Function(BuildContext context);
typedef SplashViewOnRouteListener = Function(BuildContext context);

class SplashLayout<T extends SplashLayoutController> extends YMRView<T> {
  final int duration;
  final double axisY;
  final double axisX;

  final Widget? content;
  final Widget? footer;

  final SplashViewOnExecuteListener? onExecute;
  final SplashViewOnRouteListener? onRoute;

  const SplashLayout({
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
    super.onChange,
    super.onError,
    super.onValid,
    super.onValidator,

    /// CHILD PROPERTIES
    this.duration = 5000,
    this.axisX = 0,
    this.axisY = 0,
    this.content,
    this.footer,
    this.onRoute,
    this.onExecute,
  });

  @override
  T initController() => SplashLayoutController() as T;

  @override
  T attachController(T controller) {
    return controller.fromSplashLayout(this) as T;
  }

  @override
  Widget? attach(BuildContext context, T controller) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AxisView(
            x: controller.axisX,
            y: controller.axisY,
            child: controller.content,
          ),
          Positioned(
            bottom: 0,
            child: controller.footer ?? const SizedBox(),
          ),
        ],
      ),
    );
  }

  @override
  void onInit(context, controller) {
    Timer(Duration(milliseconds: controller.duration), () {
      if (controller.isExecutable) {
        controller.onExecute?.call(context).whenComplete(() {
          return controller.onRoute?.call(controller.context!);
        });
      } else {
        controller.onRoute?.call(controller.context!);
      }
    });
  }
}

class SplashLayoutController extends ViewController {
  double axisX = 0;

  void setAxisX(double value) {
    onNotifyWithCallback(() => axisX = value);
  }

  double axisY = 0;

  void setAxisY(double value) {
    onNotifyWithCallback(() => axisY = value);
  }

  int duration = 500;

  void setDuration(int value) {
    onNotifyWithCallback(() => duration = value);
  }

  Widget? content;

  void setContent(Widget? value) {
    onNotifyWithCallback(() => content = value);
  }

  Widget? footer;

  void setFooter(Widget? value) {
    onNotifyWithCallback(() => footer = value);
  }

  SplashViewOnExecuteListener? _onExecute;

  SplashViewOnExecuteListener? get onExecute => enabled ? _onExecute : null;

  void setOnExecuteListener(SplashViewOnExecuteListener listener) {
    _onExecute = listener;
  }

  SplashViewOnRouteListener? _onRoute;

  SplashViewOnRouteListener? get onRoute => enabled ? _onRoute : null;

  void setOnRouteListener(SplashViewOnRouteListener listener) {
    _onRoute = listener;
  }

  SplashLayoutController fromSplashLayout(SplashLayout view) {
    super.fromView(view);
    axisX = view.axisX;
    axisY = view.axisY;
    duration = view.duration;
    content = view.content;
    footer = view.footer;
    _onExecute = view.onExecute;
    _onRoute = view.onRoute;
    return this;
  }

  bool get isExecutable => onExecute != null;
}
