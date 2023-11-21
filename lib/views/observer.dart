part of '../widgets.dart';

extension ObserverBool on bool {
  Observer<bool> get obx => Observer(this);
}

extension ObserverInt on int {
  Observer<int> get obx => Observer(this);
}

extension ObserverDouble on double {
  Observer<double> get obx => Observer(this);
}

extension ObserverList<T> on List<T> {
  Observer<List<T>> get obx => Observer(this);
}

class Observer<T> extends ViewController {
  T? _value;

  Observer(T? value) : _value = value;

  T? get value => _value;

  set value(T? value) => onNotifyWithCallback(() => _value = value);
}

class ViewObserver<T> extends YMRView<Observer<T>> {
  final Widget Function(BuildContext context, T? value) builder;

  const ViewObserver({
    super.key,
    required Observer<T> observer,
    required this.builder,
  }) : super(controller: observer);

  @override
  Observer<T> initController() => Observer<T>(null);

  @override
  Widget? attach(BuildContext context, Observer<T> controller) {
    return builder(context, controller.value);
  }
}
