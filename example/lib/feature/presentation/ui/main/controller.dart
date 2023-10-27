import 'package:flutter/cupertino.dart';
import 'package:flutter_androssy/core.dart';

import '../../../../index.dart';

class MainController extends AndrossyController {
  DrawerSelectionType selectionType = DrawerSelectionType.shows;
  int index = 0;

  void onNotifyNavigationIndex(int value) {
    onNotify(() => index = value);
  }

  void onNotifyWithSelection(BuildContext context, DrawerSelectionType type) {
    if (type.category == 0) {
      onNotify(() => selectionType = type);
    }
  }
}
