import 'package:shared_preferences/shared_preferences.dart';

class AndrossyConfigure {
  final Map<Type, dynamic> _proxies;

  AndrossyConfigure._({
    Map<Type, dynamic>? proxies,
  }) : _proxies = proxies ?? {};

  const AndrossyConfigure.none() : _proxies = const {};

  static Future<AndrossyConfigure> config({
    required List<Object> instances,
  }) async {
    var config = AndrossyConfigure._();
    if (instances.whereType<SharedPreferences>().isEmpty) {
      config._instance(await SharedPreferences.getInstance());
    }
    for (var i in instances) {
      await config._instance(i);
    }
    return config;
  }

  Future<void> _instance(Object data) async {
    if (data is Future) {
      var current = await data;
      _proxies.putIfAbsent(current.runtimeType, () => current);
    } else {
      _proxies.putIfAbsent(data.runtimeType, () => data);
    }
  }

  T getInstance<T>() {
    T? instance = _proxies[T];
    if (instance != null) {
      return instance;
    } else {
      throw UnimplementedError("Instance not found!");
    }
  }

  @override
  String toString() {
    return "AndrossyConfig($_proxies)";
  }
}
