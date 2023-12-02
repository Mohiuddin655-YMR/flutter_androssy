part of '../extensions.dart';

extension NumExtension on num {
  SizedBox get h => SizedBox(height: toDouble());

  SizedBox get w => SizedBox(width: toDouble());

  SizedBox get wh => SizedBox(width: toDouble(), height: toDouble());
}
