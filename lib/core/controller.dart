part of '../core.dart';

class AndrossyController {
  OnViewNotifier? _notifier;

  @protected
  void onInit(BuildContext context) {}

  @protected
  void onListener(BuildContext context) {}

  @protected
  void onPause(BuildContext context) {}

  @protected
  void onRestart(BuildContext context) {}

  @protected
  void onResume(BuildContext context) {}

  @protected
  void onStart(BuildContext context) {}

  @protected
  void onStop(BuildContext context) {}

  @protected
  void onDetached(BuildContext context) {}

  @protected
  void onDestroy(BuildContext context) {}

  @protected
  Future<bool> onBackPressed() async => true;

  @protected
  void setNotifier(OnViewNotifier? notifier) => _notifier = notifier;

  @protected
  void onNotify(VoidCallback callback) {
    if (_notifier != null) {
      _notifier?.call(callback);
    }
  }
}
