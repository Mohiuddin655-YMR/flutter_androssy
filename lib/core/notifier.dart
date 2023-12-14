import 'package:flutter/material.dart';

class AndrossyNotifier<T> extends ValueNotifier<T> {
  AndrossyNotifier(super.value);

  void update(T value) {
    this.value = value;
    notifyListeners();
  }
}
