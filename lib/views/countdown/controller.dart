part of 'view.dart';

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
        onNotify();
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
    onNotify();
    _continue();
  }

  void onStop() => _cancel();

  void onClear() {
    _cancel();
    _rt = const Duration();
    onNotify();
  }

  void _dispose() => _cancel();
}
