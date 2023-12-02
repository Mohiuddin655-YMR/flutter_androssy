import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/widgets.dart';

Future<void> main() async {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AndrossyApp(
      title: "Androssy App",
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
      title: TextView(
        text: "View Observer",
        textSize: 20,
        textColor: context.primaryColor,
        textFontWeight: FontWeight.bold,
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
        ViewObserver(
          observer: controller.counter,
          builder: (con, value) {
            return TextView(
              text: value.toString(),
              textSize: 32,
              textFontWeight: FontWeight.bold,
              textColor: Colors.grey,
              gravity: Alignment.center,
            );
          },
        ),
        Button(
          marginTop: 24,
          width: double.infinity,
          height: 50,
          borderRadius: 12,
          text: "Chat",
          textAllCaps: true,
          textFontWeight: FontWeight.bold,
          controller: controller.btn1,
        ),
      ],
    );
  }
}

class HomeController extends AndrossyController {
  final counter = Observer(0);
  final btn1 = ButtonController();

  @override
  void onListener(BuildContext context) {
    btn1.setOnClickListener((context) async {
      for (int i = 0; i <= 100; i++) {
        counter.value = i;
        await Future.delayed(const Duration(milliseconds: 100));
      }
    });
  }
}
