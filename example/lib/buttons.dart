import 'dart:developer';

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
      title: "Androssy Buttons",
      theme: ThemeData.light(useMaterial3: true)
          .copyWith(primaryColor: Colors.blue),
      darkTheme: ThemeData.dark(useMaterial3: true)
          .copyWith(primaryColor: Colors.blue),
      home: const Home(),
    );
  }
}

class Home extends AndrossyActivity<HomeController> {
  const Home({super.key});

  @override
  HomeController init(BuildContext context) {
    return HomeController();
  }

  @override
  AppBar? onCreateAppbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const TextView(
        text: "Androssy",
        textSize: 20,
        textAllCaps: true,
      ),
    );
  }

  @override
  Widget onCreate(BuildContext context) {
    return LinearLayout(
      scrollable: true,
      padding: 32,
      width: double.infinity,
      height: double.infinity,
      layoutGravity: LayoutGravity.center,
      children: [
        Button(
          width: double.infinity,
          height: 50,
          borderRadius: 12,
          text: "Chat",
          textAllCaps: true,
          textFontWeight: FontWeight.bold,
          controller: controller.btn1,
          clickEffect: ViewClickEffect(
            lowerBound: 0.8,
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: Opacity(
                  opacity: value,
                  child: child,
                ),
              );
            },
          ),
        ),
        Button(
          marginTop: 24,
          width: double.infinity,
          height: 50,
          borderRadius: 12,
          text: "Chat",
          textAllCaps: true,
          textFontWeight: FontWeight.bold,
          enabled: false,
          onClick: (_) {},
        ),
        Button(
          marginTop: 24,
          width: double.infinity,
          height: 50,
          borderRadius: 12,
          borderSize: 2,
          background: Colors.transparent,
          text: "Quote",
          textAllCaps: true,
          textFontWeight: FontWeight.bold,
          enabled: false,
          onClick: (_) {},
        ),
        Button(
          marginTop: 24,
          width: double.infinity,
          height: 50,
          borderRadius: 12,
          borderSize: 2,
          background: Colors.transparent,
          text: "Quote",
          textAllCaps: true,
          textFontWeight: FontWeight.bold,
          onClick: (_) {},
        ),
        Button(
          marginTop: 24,
          width: double.infinity,
          height: 50,
          borderRadius: 12,
          text: "Call",
          textAllCaps: true,
          textFontWeight: FontWeight.bold,
          enabled: true,
          onClick: (_) {},
          paddingHorizontal: 24,
          icon: Icons.call,
          iconSize: 24,
          iconFlexible: true,
          iconAlignment: IconAlignment.end,
        ),
        Button(
          marginTop: 24,
          width: double.infinity,
          height: 50,
          borderRadius: 12,
          text: "Call",
          textAllCaps: true,
          textFontWeight: FontWeight.bold,
          enabled: false,
          onClick: (_) {},
          paddingHorizontal: 24,
          icon: Icons.call,
          iconSize: 24,
          textCenter: true,
          iconAlignment: IconAlignment.start,
        ),
        Button(
          marginTop: 24,
          width: double.infinity,
          height: 50,
          borderRadius: 12,
          borderSize: 2,
          background: Colors.transparent,
          text: "Chat",
          textAllCaps: true,
          textFontWeight: FontWeight.bold,
          enabled: false,
          onClick: (_) {},
          paddingHorizontal: 24,
          icon: Icons.chat_bubble_outline,
          iconSize: 24,
          textCenter: true,
          iconAlignment: IconAlignment.start,
        ),
        Button(
          marginTop: 24,
          width: double.infinity,
          height: 50,
          borderRadius: 12,
          borderSize: 2,
          background: Colors.transparent,
          text: "Chat",
          textAllCaps: true,
          textFontWeight: FontWeight.bold,
          enabled: true,
          onClick: (_) {},
          paddingHorizontal: 24,
          icon: Icons.chat_bubble_outline,
          iconSize: 24,
          iconFlexible: true,
          iconAlignment: IconAlignment.end,
        ),
        LinearLayout(
          marginTop: 24,
          orientation: Axis.horizontal,
          children: [
            Button(
              height: 50,
              width: 50,
              shape: ViewShape.circular,
              enabled: true,
              iconOnly: true,
              icon: Icons.call,
              iconSize: 24,
              onToggleClick: (_) {},
            ),
            Button(
              marginStart: 16,
              height: 50,
              width: 50,
              shape: ViewShape.circular,
              activated: false,
              enabled: false,
              iconOnly: true,
              icon: Icons.call,
              iconSize: 24,
              onClick: (_) {},
            ),
            Button(
              marginStart: 16,
              height: 50,
              width: 50,
              borderSize: 2,
              background: Colors.transparent,
              shape: ViewShape.circular,
              activated: false,
              enabled: false,
              iconOnly: true,
              icon: Icons.call,
              iconSize: 24,
              onClick: (_) {},
            ),
            Button(
              marginStart: 16,
              height: 50,
              width: 50,
              shape: ViewShape.circular,
              borderSize: 2,
              background: Colors.transparent,
              enabled: true,
              iconOnly: true,
              icon: Icons.call,
              iconSize: 24,
              activated: true,
              onToggleClick: (_) {},
            ),
          ],
        ),
      ],
    );
  }
}

class HomeController extends AndrossyController {
  final btn1 = ButtonController();
  final btn2 = ButtonController();

  @override
  void onListener(BuildContext context) {
    btn1.setOnClickListener((context) {
      log("Chat button is clicked!");
    });
    btn2.setOnToggleClickListener((value) {
      log("Button state is ${value ? "Selected" : "Unselected"}");
    });
  }
}
