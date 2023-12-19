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
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
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
  Widget onCreate(BuildContext context, AndrossyInstance instance) {
    return LinearLayout(
      scrollable: true,
      padding: 32,
      width: double.infinity,
      height: double.infinity,
      layoutGravity: LayoutGravity.center,
      children: [
        // CONTROLLER BUTTONS
        Button(
          width: double.infinity,
          height: 50,
          borderRadius: 12,
          text: "Chat",
          textAllCaps: true,
          textFontWeight: FontWeight.bold,
          controller: controller.btn1,
        ),
        Button(
          controller: controller.btn2,
          marginTop: 24,
          width: double.infinity,
          height: 50,
          borderRadius: 12,
          text: "Chat",
          textAllCaps: true,
          textFontWeight: FontWeight.bold,
          activated: true,
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
        // TOGGLE BUTTONS
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
          borderSize: 2,
          background: Colors.transparent,
          text: "Quote",
          textAllCaps: true,
          textFontWeight: FontWeight.bold,
          activated: true,
          onToggle: (_) {},
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
        // ICON BUTTONS
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
          enabled: true,
          activated: true,
          paddingHorizontal: 24,
          icon: Icons.call,
          iconSize: 24,
          iconFlexible: true,
          onToggle: (_) {},
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
        // ICON BORDER BUTTONS
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
          paddingHorizontal: 24,
          icon: Icons.chat_bubble_outline,
          iconSize: 24,
          iconFlexible: true,
          activated: true,
          onToggle: (_) {},
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
        // ICON CIRCULAR BUTTONS
        LinearLayout(
          marginTop: 24,
          orientation: Axis.horizontal,
          children: [
            Button(
              height: 50,
              width: 50,
              shape: ViewShape.circular,
              activated: false,
              enabled: true,
              iconOnly: true,
              icon: Icons.call,
              iconSize: 24,
              onClick: (_) {},
            ),
            Button(
              marginHorizontal: 24,
              height: 50,
              width: 50,
              shape: ViewShape.circular,
              enabled: true,
              iconOnly: true,
              icon: Icons.call,
              iconSize: 24,
              activated: true,
              onToggle: (_) {},
            ),
            Button(
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
          ],
        ),
        // ICON CIRCULAR BORDER BUTTONS
        LinearLayout(
          marginTop: 24,
          orientation: Axis.horizontal,
          children: [
            Button(
              height: 50,
              width: 50,
              borderSize: 2,
              background: Colors.transparent,
              shape: ViewShape.circular,
              activated: false,
              enabled: true,
              iconOnly: true,
              icon: Icons.call,
              iconSize: 24,
              onClick: (_) {},
            ),
            Button(
              marginHorizontal: 24,
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
              onToggle: (_) {},
            ),
            Button(
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
