part of '../widgets.dart';

class CountdownView extends YMRView<CountdownViewController> {
  final Duration? target;
  final Duration? decrement;
  final Duration? periodic;

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
    super.ripple,
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
    required this.builder,
  });

  @override
  CountdownViewController initController() => CountdownViewController();

  @override
  CountdownViewController attachController(CountdownViewController controller) {
    return controller.fromCountdownView(this);
  }

  @override
  void onInit(CountdownViewController controller) => controller._onStart();

  @override
  void onDispose(CountdownViewController controller) => controller._dispose();

  @override
  Widget? attach(BuildContext context, CountdownViewController controller) {
    return builder(context, controller._rt);
  }
}

class CountdownViewController extends ViewController {
  Duration target = const Duration(minutes: 2);
  Duration decrement = const Duration(seconds: 1);
  Duration periodic = const Duration(seconds: 1);

  late Timer _timer;
  late Duration _rt = target;

  CountdownViewController fromCountdownView(CountdownView view) {
    super.fromView(view);
    target = view.target ?? const Duration(minutes: 2);
    decrement = view.decrement ?? const Duration(seconds: 1);
    periodic = view.periodic ?? const Duration(seconds: 1);
    return this;
  }

  void _onStart() {
    _timer = Timer.periodic(periodic, (ticker) {
      if (_rt.inSeconds <= 0) {
        ticker.cancel();
      } else {
        _rt = _rt - decrement;
      }
      onNotify();
    });
  }

  void onRestart() {
    _timer.cancel();
    _rt = target;
    _onStart();
  }

  void onStop() => _timer.cancel();

  void _dispose() => _timer.cancel();
}

extension CountdownDurationExtension on Duration {
  Duration get current {
    return Duration(
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
      microseconds: microseconds,
    );
  }

  int get days => inDays;

  int get hours => inHours - (inDays * 24);

  int get minutes => inMinutes - (inHours * 60);

  int get seconds => inSeconds - (inMinutes * 60);

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
