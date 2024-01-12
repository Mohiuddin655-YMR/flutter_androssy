import 'dart:ui';

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
      title: "Slide Image View",
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
        text: "Slide Layout",
        textSize: 20,
        textColor: context.primaryColor,
        textFontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget onCreate(BuildContext context) {
    return SlideLayout(
      background: Colors.grey.shade100,
      borderRadius: 24,
      margin: 24,
      frameRatio: 9 / 12,
      items: List.generate(5, (index) {
        return "https://images.pexels.com/photos/45853/grey-crowned-crane-bird-crane-animal-45853.jpeg?auto=compress&cs=tinysrgb&w=600";
      }),
      itemBuilder: (context, index, item) {
        return ImageView(
          image: item,
          scaleType: BoxFit.cover,
        );
      },
      counterHandler: (index, size) {
        log("$index/$size");
      },
      counterBuilder: (con, ind, size, i) {
        return TextView(
          margin: 24,
          textSize: 24,
          textColor: Colors.white,
          textFontWeight: FontWeight.bold,
          paddingHorizontal: 16,
          paddingVertical: 8,
          borderRadius: 25,
          background: Colors.red,
          backdropFilter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
          text: "${ind + 1}",
          textAlign: TextAlign.center,
          gravity: Alignment.center,
        );
      },
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
