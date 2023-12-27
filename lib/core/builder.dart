import 'package:flutter/material.dart';

import 'androssy.dart';
import 'provider.dart';

typedef AndrossyViewBuilder = Widget Function(
  BuildContext context,
  Androssy androssy,
);

class AndrossyBuilder extends StatelessWidget {
  final AndrossyViewBuilder builder;
  final String? message;

  const AndrossyBuilder({
    super.key,
    required this.builder,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    var provider = AndrossyProvider.of(context);
    if (provider != null) {
      return ValueListenableBuilder(
        valueListenable: provider.notifier,
        builder: (context, value, old) => builder(context, value),
      );
    } else {
      return builder(context, const Androssy());
    }
  }
}
