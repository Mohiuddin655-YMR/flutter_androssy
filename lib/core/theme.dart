import 'package:flutter/material.dart';

class AndrossyTheme {
  final ThemeData light;
  final ThemeData dark;

  const AndrossyTheme(
    this.light,
    ThemeData? dark,
  ) : dark = dark ?? light;
}
