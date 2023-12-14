import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';

class AndrossyInstance<T extends AndrossyController> {
  Androssy? _androssy;
  BuildContext? _context;
  T? _controller;

  AndrossyInstance._();

  static AndrossyInstance<T> init<T extends AndrossyController>() {
    return _Instances.create<T>(() => AndrossyInstance<T>._());
  }

  AndrossyInstance<T> get i => init<T>();

  void create(BuildContext context, T controller) {
    i._context = context;
    i._controller = controller;
  }

  void close() {
    i._androssy = null;
    i._context = null;
    i._controller = null;
    _Instances.remove<T>();
  }

  BuildContext get context {
    if (i._context != null) {
      return i._context!;
    } else {
      throw Exception("Instance had dead");
    }
  }

  T get controller {
    if (i._controller != null) {
      return i._controller!;
    } else {
      throw Exception("Instance had dead");
    }
  }

  Androssy get androssy => i._androssy ?? const Androssy();

  set androssy(Androssy value) => i._androssy = value;

  /// User properties
  AndrossyUser get user => i.androssy.user;

  String? get currentUid => i.user.uid;
}

class _Instances {
  const _Instances._();

  static final Map<Type, dynamic> _proxies = {};

  static AndrossyInstance<T> create<T extends AndrossyController>(
    AndrossyInstance<T> Function() instance,
  ) {
    return _proxies[T] ??= instance();
  }

  static void remove<T extends AndrossyController>() => _proxies.remove(T);
}
