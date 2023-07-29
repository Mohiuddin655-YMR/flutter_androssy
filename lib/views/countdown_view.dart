part of '../widgets.dart';

class CountdownView extends YMRView<CountdownViewController> {
  final Duration? target;
  final Duration? decrement;
  final Duration? periodic;
  final bool? initialStartMode;

  final Widget Function(BuildContext, Duration) builder;

  const CountdownView({
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
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onToggle,
    this.target,
    this.decrement,
    this.periodic,
    this.initialStartMode,
    required this.builder,
  });

  @override
  CountdownViewController initController() => CountdownViewController();

  @override
  CountdownViewController attachController(CountdownViewController controller) {
    return controller.fromCountdownView(this);
  }

  @override
  void onInit(CountdownViewController controller) {
    if (controller.initialStartMode) controller._continue();
  }

  @override
  void onDispose(CountdownViewController controller) => controller._dispose();

  @override
  Widget? attach(BuildContext context, CountdownViewController controller) {
    return builder(context, controller._rt);
  }
}

class CountdownViewController extends ViewController {
  Duration targetTime = const Duration(minutes: 2);
  Duration decrementTime = const Duration(seconds: 1);
  Duration periodicTime = const Duration(seconds: 1);
  bool initialStartMode = true;

  late Duration _rt = targetTime;
  Timer? _timer;
  bool _isRunning = false;

  CountdownViewController fromCountdownView(CountdownView view) {
    super.fromView(view);
    targetTime = view.target ?? const Duration(minutes: 2);
    decrementTime = view.decrement ?? const Duration(seconds: 1);
    periodicTime = view.periodic ?? const Duration(seconds: 1);
    initialStartMode = view.initialStartMode ?? true;
    return this;
  }

  void _continue() {
    if (!_isRunning) {
      _timer = Timer.periodic(periodicTime, (ticker) {
        if (_rt.inSeconds <= 0) {
          ticker.cancel();
        } else {
          _rt = _rt - decrementTime;
        }
        _notify;
      });
    }
    _isRunning = true;
  }

  void _cancel() {
    if (_timer != null) _timer!.cancel();
    _isRunning = false;
  }

  void onStart() => _continue();

  void onRestart() {
    _cancel();
    _rt = targetTime;
    _notify;
    _continue();
  }

  void onStop() => _cancel();

  void onClear() {
    _cancel();
    _rt = const Duration();
    _notify;
  }

  void _dispose() => _cancel();
}

extension CountdownDurationExtension on Duration {
  int get days => inDays;

  String get days2D => inDays.x2D;

  String get days3D => inDays.x3D;

  int get hours => inHours - (inDays * 24);

  String get hours2D => hours.x2D;

  String get hours3D => hours.x3D;

  int get minutes => inMinutes - (inHours * 60);

  String get minutes2D => minutes.x2D;

  String get minutes3D => minutes.x3D;

  int get seconds => inSeconds - (inMinutes * 60);

  String get seconds2D => seconds.x2D;

  String get seconds3D => seconds.x3D;

  int get milliseconds => inMilliseconds - (inSeconds * 1000);

  int get microseconds => inMicroseconds - (inMilliseconds * 1000);
}

extension CountdownExtension on int? {
  num get use => this ?? 0;

  String get x2D => use >= 10 ? "$use" : "0$use";

  String get x3D {
    if (use >= 100) {
      return "$use";
    } else if (use >= 10) {
      return "0$use";
    } else {
      return "00$use";
    }
  }
}
