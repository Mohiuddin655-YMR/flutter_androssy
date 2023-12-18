import 'package:flutter/material.dart';

import 'controller.dart';

abstract class AndrossyLayout<T extends AndrossyController>
    extends StatelessWidget {
  final T controller;

  const AndrossyLayout({
    super.key,
    required this.controller,
  });
}
