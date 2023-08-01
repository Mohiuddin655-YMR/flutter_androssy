import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

import 'layout.dart';

class HomeActivity extends Activity {
  static const String title = "Home";
  static const String route = "/";

  const HomeActivity({
    super.key,
    super.background,
  });

  @override
  Widget onCreate(BuildContext context) {
    if (kDebugMode) {
      print("onCreate");
    }
    return const HomeLayout();
  }

  @override
  AppBar? onCreateAppbar(BuildContext context) {
    return null;
  }

  @override
  Widget? onCreateBottomSheet(BuildContext context) {
    return null;
  }

  @override
  Widget? onCreateBottomNavigationBar(BuildContext context) {
    return null;
  }

  @override
  Widget? onCreateDrawer(BuildContext context) {
    return null;
  }

  @override
  Widget? onCreateFloatingButton(BuildContext context) {
    return null;
  }

  @override
  List<Widget>? onCreatePersistentFooterButtons(BuildContext context) {
    return null;
  }

  @override
  void onInit() {
    if (kDebugMode) {
      print("onInit");
    }
  }

  @override
  void onStart() {
    if (kDebugMode) {
      print("onStart");
    }
  }

  @override
  void onRestart() {
    if (kDebugMode) {
      print("onRestart");
    }
  }

  @override
  void onListener() {
    if (kDebugMode) {
      print("onListener");
    }
  }

  @override
  void onPause() {
    if (kDebugMode) {
      print("onPause");
    }
  }

  @override
  void onResume() {
    if (kDebugMode) {
      print("onResume");
    }
  }

  @override
  void onStop() {
    if (kDebugMode) {
      print("onStop");
    }
  }

  @override
  Future<bool> onBackPressed() async {
    if (kDebugMode) {
      print("onBackPressed");
    }
    return false;
  }

  @override
  void onDetached() {
    if (kDebugMode) {
      print("onDetached");
    }
  }

  @override
  void onDestroy() {
    if (kDebugMode) {
      print("onDestroy");
    }
  }

  @override
  void onDrawerChanged(bool changed) {}
}
