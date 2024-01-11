import 'dart:math';
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
      title: "View",
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const Home(),
    );
  }
}

class Home extends AndrossyActivity<HomeController> {
  const Home({
    super.key,
  });

  @override
  bool get transparentAppBar => true;

  @override
  HomeController init(BuildContext context) => HomeController();

  @override
  Widget onCreate(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const RawImageView(
          width: double.infinity,
          height: double.infinity,
          scaleType: BoxFit.cover,
          image:
          "https://images.pexels.com/photos/45853/grey-crowned-crane-bird-crane-animal-45853.jpeg?auto=compress&cs=tinysrgb&w=600",
          imageType: ImageType.network,
        ),
        TextView(
          width: double.infinity,
          height: double.infinity,
          borderRadius: 25,
          backdropFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          text: 'Hi Dropper',
          gravity: Alignment.center,
          textSize: 24,
          textAllCaps: true,
          textFontWeight: FontWeight.bold,
          textColor: Colors.white,
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
