part of '../widgets.dart';

class CountdownBuilder extends StatefulWidget {
  final Duration targetDuration;
  final Duration decrementDuration;
  final Widget Function(Duration) builder;

  const CountdownBuilder({
    super.key,
    this.targetDuration = const Duration(minutes: 2),
    this.decrementDuration = const Duration(seconds: 1),
    required this.builder,
  });

  @override
  State<StatefulWidget> createState() => _CountdownBuilderState();
}

class _CountdownBuilderState extends State<CountdownBuilder> {
  late Timer _timer;
  late Duration _rt = widget.targetDuration;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.decrementDuration, (timer) {
      setState(() {
        if (_rt.inSeconds <= 0) {
          _timer.cancel();
        } else {
          _rt = _rt - widget.decrementDuration;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_rt);
  }
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
