import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

class CountdownView extends YMRView<CountdownViewController> {
  final Duration? targetDuration;
  final Duration? decrementDuration;
  final Widget Function(Duration) builder;

  const CountdownView({
    super.key,
    this.targetDuration,
    this.decrementDuration,
    required this.builder,
  });

  @override
  CountdownViewController initController() {
    return CountdownViewController();
  }

  @override
  CountdownViewController attachController(CountdownViewController controller) {
    return controller.fromCountdownView(this);
  }

  @override
  void onInit(CountdownViewController controller) {
    controller.onStart();
  }

  @override
  void onDispose(CountdownViewController controller) {
    controller.onStop();
  }

  @override
  Widget? attach(BuildContext context, CountdownViewController controller) {
    return builder(controller.targetDuration);
  }
}

class CountdownViewController extends ViewController {
  Duration decrementDuration = const Duration(seconds: 1);
  Duration targetDuration = const Duration(seconds: 120);

  late Timer _timer;

  void onStart() {
    _timer = Timer.periodic(decrementDuration, (timer) {
      if (targetDuration.inSeconds <= 0) {
        timer.cancel();
      } else {
        targetDuration = targetDuration - decrementDuration;
      }
      onNotify();
    });
  }

  void onStop() {
    _timer.cancel();
  }

  CountdownViewController fromCountdownView(CountdownView view) {
    super.fromView(view);
    decrementDuration = view.decrementDuration ?? const Duration(seconds: 1);
    targetDuration = view.targetDuration ?? const Duration(seconds: 120);
    return this;
  }
}

extension CounterExtension on int? {
  num get use => this ?? 0;

  String get x2Digit => use >= 10 ? "$use" : "0$use";

  String get x3Digit {
    if (use >= 100) {
      return "$use";
    } else if (use >= 10) {
      return "0$use";
    } else {
      return "00$use";
    }
  }
}
