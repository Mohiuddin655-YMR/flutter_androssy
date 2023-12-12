import 'package:flutter/material.dart';

extension NumExtension on num {
  SizedBox get all => SizedBox(width: toDouble(), height: toDouble());

  SizedBox get h => SizedBox(height: toDouble());

  SizedBox get w => SizedBox(width: toDouble());
}
