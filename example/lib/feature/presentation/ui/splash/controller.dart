import 'package:flutter/material.dart';
import 'package:flutter_andomie/core.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_app_navigator/app_navigator.dart';

import '../../index.dart';

class SplashController extends AndrossyController
    with OnScreenLoaderMixin<String> {
  late ScreenLoader<String> loader;

  @override
  void onInit(BuildContext context) {
    loader = ScreenLoader.getInstance<String>(
      context: context,
      mixin: this,
      loaders: [
        // Loader<String>(
        //   value: AuthScreens.route,
        //   validation: (context) async => !UserHelper.isAuthenticated,
        // ),
      ],
    );
  }

  @override
  void onDefault(BuildContext context) {
    AppNavigator.load(
      context,
      MainScreens.route,
      flag: Flag.clear,
    );
  }

  @override
  void onHold(ProviderEvent<String> event) {
    AppNavigator.load(
      event.context,
      event.value,
    );
  }
}
