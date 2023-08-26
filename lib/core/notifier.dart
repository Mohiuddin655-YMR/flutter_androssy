part of 'core.dart';

class AndrossyNotifier<T> extends ValueNotifier<T> {
  AndrossyNotifier(super.value);

  void setValue(T value) {
    this.value = value;
    notifyListeners();
  }

  T getValue() => value;
}
