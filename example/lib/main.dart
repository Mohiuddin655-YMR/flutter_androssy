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
      title: "Edit Layout",
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
    return NavigationView(
      onIndexChanged: (value) => controller.changeNavigationIndex(
        context,
        value,
      ),
      elevation: 50,
      currentIndex: controller.navigationIndex,
      positionType: ViewPositionType.bottom,
      paddingVertical: 12,
      background: Colors.white,
      spaceBetween: 8,
      iconThemeState: ValueState(
        primary: IconThemeData(
          size: 24,
          color: Colors.grey,
        ),
        secondary: IconThemeData(
          size: 32,
          color: context.primaryColor,
        ),
      ),
      titleStyleState: ValueState(
        primary: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
        ),
        secondary: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: context.primaryColor,
        ),
      ),
      items: const [
        NavigationItem(
          title: "Home",
          iconState: ValueState(
            primary: Icons.home_outlined,
            secondary: Icons.home,
          ),
        ),
        NavigationItem(
          title: "Notifications",
          iconState: ValueState(
            primary: Icons.notifications_outlined,
            secondary: Icons.notifications,
          ),
        ),
        NavigationItem(
          title: "Profile",
          iconState: ValueState(
            primary: Icons.person_outline,
            secondary: Icons.person,
          ),
        ),
      ],
      builder: (context, index) {
        if (index == 1) {
          return Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
          );
        } else if (index == 2) {
          return Container(
            color: Colors.green,
            width: double.infinity,
            height: double.infinity,
          );
        } else {
          return Container(
            color: Colors.blue,
            width: double.infinity,
            height: double.infinity,
          );
        }
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
