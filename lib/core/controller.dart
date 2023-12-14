import 'package:flutter/material.dart';

import '../views/view/view.dart';

class AndrossyController {
  String identifier = "";
  OnViewNotifier? _notifier;

  void onInit(BuildContext context) {}

  void onReady(BuildContext context) {}

  void onListener(BuildContext context) {}

  void onPause(BuildContext context) {}

  void onRestart(BuildContext context) {}

  void onResume(BuildContext context) {}

  void onStart(BuildContext context) {}

  void onStop(BuildContext context) {}

  void onDetached(BuildContext context) {}

  void onDestroy(BuildContext context) {}

  Future<bool> onBackPressed() async => true;

  void setNotifier(OnViewNotifier? notifier) => _notifier = notifier;

  void onNotify([VoidCallback? callback]) {
    if (_notifier != null) {
      _notifier?.call(callback ?? () {});
    }
  }
}
