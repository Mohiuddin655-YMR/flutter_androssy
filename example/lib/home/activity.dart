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
    print("onCreate");
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
    print("onInit");
  }

  @override
  void onStart() {
    print("onStart");
  }

  @override
  void onRestart() {
    print("onRestart");
  }

  @override
  void onListener() {
    print("onListener");
  }

  @override
  void onPause() {
    print("onPause");
  }

  @override
  void onResume() {
    print("onResume");
  }

  @override
  void onStop() {
    print("onStop");
  }

  @override
  Future<bool> onBackPressed() async {
    print("onBackPressed");
    return false;
  }

  @override
  void onDetached() {
    print("onDetached");
  }

  @override
  void onDestroy() {
    print("onDestroy");
  }

  @override
  void onDrawerChanged(bool changed) {}
}
