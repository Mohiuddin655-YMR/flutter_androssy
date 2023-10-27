import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';

abstract class BaseFragment<T extends AndrossyController>
    extends AndrossyFragment<T> {
  const BaseFragment({
    super.key,
  });

  @override
  T init(BuildContext context) {
    return AndrossyController() as T;
  }
}
