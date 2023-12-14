import 'package:flutter/material.dart';

import '../core/provider.dart';

extension StringExtension on String {
  String translate(BuildContext context) {
    return AndrossyProvider.of(context)?.localize(this) ?? this;
  }
}
