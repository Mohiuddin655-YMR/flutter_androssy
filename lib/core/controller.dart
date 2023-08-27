part of '../core.dart';

class AndrossyController {
  OnViewNotifier? _notifier;

  void setNotifier(OnViewNotifier? notifier) => _notifier = notifier;

  void onNotify(VoidCallback callback) {
    if (_notifier != null) {
      _notifier?.call(callback);
    }
  }
}
