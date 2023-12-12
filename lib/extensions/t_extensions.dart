import 'dart:developer';

extension TExtension<T> on T {
  T get logType {
    log("$runtimeType");
    return this;
  }

  T get logValue {
    log(toString());
    return this;
  }

  T get logValueType {
    log("${toString()} ($runtimeType)");
    return this;
  }
}
