import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';

Future<void> main() async {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Settings View",
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const Home(),
    );
  }
}

class Home extends AndrossyActivity<HomeController> {
  const Home({super.key});

  @override
  HomeController init(BuildContext context) => HomeController();

  @override
  AppBar? onCreateAppbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: TextView(
        text: "Edit Layout",
        textSize: 20,
        textColor: context.primaryColor,
        textFontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget onCreate(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return LinearLayout(
      width: double.infinity,
      background: isDark.logValue ? Colors.black : Colors.white,
      children: [
        SettingsView.arrow(
          icon: Icons.account_circle_outlined,
          rippleColor: Colors.black12,
          pressedColor: Colors.black12,
          title: "This is a arrow title",
          summary: "This is a arrow summary",
          onClick: (v) {
            "ARROW IS CLICKED".log("arrow");
          },
        ),
        SettingsView.arrow(
          icon: Icons.account_circle_outlined,
          enabled: false,
          rippleColor: Colors.black12,
          pressedColor: Colors.black12,
          title: "This is a arrow title",
          summary: "This is a arrow summary",
          onClick: (v) {
            "ARROW IS CLICKED".log("arrow");
          },
        ),
        SettingsView.checkmark(
          icon: Icons.account_circle_outlined,
          rippleColor: Colors.black12,
          pressedColor: Colors.black12,
          title: "This is a arrow title",
          summary: "This is a arrow summary",
          onToggleClick: (v) {
            "CHECKMARK IS CHANGED => $v".log("checkmark");
          },
        ),
        SettingsView.checkmark(
          activated: true,
          icon: Icons.account_circle_outlined,
          enabled: false,
          rippleColor: Colors.black12,
          pressedColor: Colors.black12,
          title: "This is a arrow title",
          summary: "This is a arrow summary",
          onToggleClick: (v) {
            "CHECKMARK IS CHANGED => $v".log("checkmark");
          },
        ),
        SettingsView.switcher(
          icon: Icons.settings,
          rippleColor: Colors.black12,
          pressedColor: Colors.black12,
          title: "This is a switcher title",
          summary: "This is a switcher summary",
          onToggleClick: (v) {
            "SWITCHER IS CHANGED => $v".log("switcher");
          },
        ),
        SettingsView.switcher(
          icon: Icons.settings,
          enabled: false,
          rippleColor: Colors.black12,
          pressedColor: Colors.black12,
          title: "This is a switcher title",
          summary: "This is a switcher summary",
          onToggleClick: (v) {
            "SWITCHER IS CHANGED => $v".log("switcher");
          },
        ),
      ],
    );
  }
}

class HomeController extends AndrossyController {
  int navigationIndex = 0;

  void changeNavigation(BuildContext context, int value) {
    navigationIndex = value;
  }

  void changeNavigationIndex(BuildContext context, int value) {
    onNotify(() => changeNavigation(context, value));
  }
}
