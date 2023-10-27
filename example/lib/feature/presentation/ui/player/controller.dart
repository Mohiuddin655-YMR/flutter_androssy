import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_androssy/widgets.dart';

class PlayerController extends AndrossyController {
  int tabIndex = 0;
  TextViewController tvEpisodes = TextViewController();
  TextViewController tvRelative = TextViewController();

  @override
  void onListener(BuildContext context) {
    tvEpisodes.setOnClickListener((context) => onNotifyIndex(0));
    tvRelative.setOnClickListener((context) => onNotifyIndex(1));
  }

  void onNotifyIndex(int index) {
    onNotify(() => tabIndex = index);
  }
}
