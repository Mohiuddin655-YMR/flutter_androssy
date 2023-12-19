import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';

class AndrossyInstance<T extends AndrossyController> {
  final String id;
  Androssy? _androssy;
  BuildContext? _context;
  T? _controller;

  AndrossyInstance._(this.id);

  static AndrossyInstance<T> init<T extends AndrossyController>(String id) {
    return _Instances.create<T>(id, () => AndrossyInstance<T>._(id));
  }

  static AndrossyInstance<T>? find<T extends AndrossyController>([String? id]) {
    return _Instances.find(id ?? "");
  }

  static T? findController<T extends AndrossyController>([String? id]) {
    return find<T>(id)?.controller;
  }

  AndrossyInstance<T> get _i => init<T>(id);

  void create(BuildContext context, T controller) {
    _i._context = context;
    _i._controller = controller;
  }

  void close(String id) {
    _i._androssy = null;
    _i._context = null;
    _i._controller = null;
    _Instances.remove<T>(id);
  }

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

  static AndrossyInstance<T> create<T extends AndrossyController>(
    String id,
    AndrossyInstance<T> Function() instance,
  ) {
    return _proxies["$T<$id>"] ??= instance();
  }

  static AndrossyInstance<T>? find<T extends AndrossyController>(String id) {
    return _proxies["$T<$id>"];
  }

  static void remove<T extends AndrossyController>(String id) {
    _proxies.remove("$T<$id>");
  }
}
