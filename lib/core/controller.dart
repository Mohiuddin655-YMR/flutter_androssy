import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart' show OnViewNotifier;

class AndrossyController {
  String identifier = "";
  OnViewNotifier? _notifier;

  void onInit(BuildContext context) {}

  void onReady(BuildContext context) {}

  void onListener(BuildContext context) {}

  void onPaused(BuildContext context) {}

  void onRestart(BuildContext context) {}

  void onResumed(BuildContext context) {}

  void onStart(BuildContext context) {}

  void onStop(BuildContext context) {}

  void onDetached(BuildContext context) {}

  void onHidden(BuildContext context) {}

  void onDestroy(BuildContext context) {}

  void setNotifier(OnViewNotifier? notifier) => _notifier = notifier;

  void onNotify([VoidCallback? callback]) {
    if (_notifier != null) {
      _notifier?.call(callback ?? () {});
    }
  }
}
