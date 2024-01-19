import 'package:flutter/material.dart';

import 'androssy.dart';
import 'controller.dart';
import 'user.dart';

class AndrossyInstance<T extends AndrossyController> {
  final String? id;
  Androssy? _androssy;
  BuildContext? _context;
  T? _controller;

  AndrossyInstance._([this.id]);

  static AndrossyInstance<T> init<T extends AndrossyController>(String? id) {
    return _Instances.create<T>(() => AndrossyInstance<T>._(id), id);
  }

  static AndrossyInstance<T>? find<T extends AndrossyController>([String? id]) {
    return _Instances.find<T>(id);
  }

  static T? findController<T extends AndrossyController>([String? id]) {
    return find<T>(id)?.controller;
  }

  AndrossyInstance<T> get _i => init<T>(id);

  void attach(BuildContext context, T controller) {
    _i._context = context;
    _i._controller = controller;
  }

  void clear() => _Instances.clear();

  void close([String? id]) => _Instances.remove<T>(id);

  BuildContext get context {
    if (_i._context != null) {
      return _i._context!;
    } else {
      throw Exception("Instance deactivated");
    }
  }

  T get controller {
    if (_i._controller != null) {
      return _i._controller!;
    } else {
      throw Exception("Instance deactivated");
    }
  }

  Androssy get androssy => _i._androssy ?? const Androssy();

  set androssy(Androssy value) => _i._androssy = value;

  /// User properties
  AndrossyUser get user => _i.androssy.user;

  String? get currentUid => _i.user.uid;
}

class _Instances {
  const _Instances._();

  static final Map<String, dynamic> _proxies = {};

  static String _key<T extends AndrossyController>([String? name]) {
    return name != null && name.isNotEmpty ? "$T<$name>" : "$T";
  }

  static AndrossyInstance<T> create<T extends AndrossyController>(
      AndrossyInstance<T> Function() instance, [
        String? name,
      ]) {
    return _proxies[_key<T>(name)] ??= instance();
  }

  static AndrossyInstance<T>? find<T extends AndrossyController>([
    String? name,
  ]) {
    return _proxies[_key<T>(name)];
  }

  static void remove<T extends AndrossyController>([String? name]) {
    // _proxies.remove(_key<T>(name));
  }

  static void clear() => _proxies.clear();
}
