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
      title: "Androssy Example",
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
          width: 200,
          borderRadius: 16,
          text: "Start",
          textAllCaps: true,
          textFontWeight: FontWeight.bold,
          controller: controller.btnStart,
        ),
      ],
    );
  }
}

class HomeController extends AndrossyController {
  final counter = Observer(0);
  final btnStart = ButtonController();

  @override
  void onListener(BuildContext context) {
    btnStart.setOnClickListener((context) async {
      btnStart.setEnabled(false);
      for (int i = 0; i <= 100; i++) {
        counter.value = i;
        if (i == 100) {
          btnStart.setEnabled(true);
        }
        await Future.delayed(const Duration(milliseconds: 100));
      }
    });
  }
}
