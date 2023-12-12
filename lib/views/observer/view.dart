import 'package:flutter/material.dart';

import '../view/view.dart';

part 'controller.dart';
part 'extension.dart';

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
