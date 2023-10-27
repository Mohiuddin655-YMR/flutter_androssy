import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../../../index.dart';

class SplashActivity extends AndrossyActivity<SplashController> {
  const SplashActivity({
    super.key,
  });

  @override
  SplashController init(BuildContext context) {
    return SplashController();
  }

  @override
  AndrossyAppbarConfig appbarConfig(BuildContext context) {
    return const AndrossyAppbarConfig(
      backgroundColor: Colors.transparent,
      toolbarHeight: 0,
    );
  }

  @override
  StatusBarConfig statusBarConfig(
    BuildContext context,
    StatusBarConfig config,
  ) {
    return config.copyWith(color: Colors.transparent);
  }

  @override
  AndrossyScreenConfig config(BuildContext context) {
    return const AndrossyScreenConfig(
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: false,
    );
  }

  @override
  Widget onCreate(context, instance) {
    ThemeData theme = Theme.of(context);
    var a = theme.textTheme.titleLarge;
    var b = theme.textTheme.titleSmall;
    return SplashView(
      bodyY: 5,
      title: AppInfo.name,
      titleColor: a?.color,
      titleSize: a?.fontSize,
      subtitle: AppInfo.description,
      subtitleColor: b?.color,
      subtitleSize: b?.fontSize,
      subtitleWeight: FontWeight.w300,
      logo: LogoContent.logo,
      logoRadius: LogoContent.sizeRadiusLarge,
      logoSize: LogoContent.sizeLarge,
      onExecute: controller.loader,
    );
  }
}
