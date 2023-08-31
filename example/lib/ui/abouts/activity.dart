import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_androssy/core.dart';

import '../../index.dart';

class AboutsActivity extends BaseActivity<AboutsController> {
  static const String route = "/abouts";
  final AboutScreenType? type;

  const AboutsActivity({
    super.key,
    super.title = "Abouts",
    super.elevation = 0,
    this.type,
  });

  @override
  AboutsController init(BuildContext context) {
    return AboutsController();
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
    return const Text("Abouts");
  }
}
