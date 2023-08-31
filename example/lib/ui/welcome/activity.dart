import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_androssy/core.dart';

import '../../index.dart';

class WelcomeActivity extends BaseActivity<WelcomeController> {
  static const String route = "/welcome";

  const WelcomeActivity({
    super.key,
    super.title = "Welcome",
    super.elevation = 0,
  });

  @override
  WelcomeController init(BuildContext context) {
    return WelcomeController();
  }

  @override
  AndrossyAppbarConfig appbarConfig(BuildContext context) {
    return AndrossyAppbarConfig(
      backgroundColor: AppColors.overlayColor.detect(instance.isDarkTheme),
      titleTextStyle: TextStyle(
        color: AppColors.textColor.detect(instance.isDarkTheme).t75,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness:
            instance.isDarkTheme ? Brightness.light : Brightness.dark,
        statusBarIconBrightness:
            instance.isDarkTheme ? Brightness.light : Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor:
            AppColors.overlayColor.detect(instance.isDarkTheme),
      ),
    );
  }

  @override
  Widget onCreate(context, instance) {
    return const Text("Welcome");
  }
}
