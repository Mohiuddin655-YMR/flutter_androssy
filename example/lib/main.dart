import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Androssy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  ButtonController button = ButtonController();
  CountdownViewController controller = CountdownViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("BottomNavigationView"),
      ),
      body: NavigationView(
        positionType: ViewPositionType.top,
        background: Colors.white,
        iconTint: Colors.grey,
        iconTintState: ValueState.active(
          activated: Colors.black,
          inactivated: Colors.grey,
        ),
        titleColor: Colors.black,
        titleColorState: ValueState.active(
          activated: Colors.black,
          inactivated: Colors.grey,
        ),
        paddingVertical: 12,
        items: const [
          NavigationContent(
            title: "Home",
            icon: Icons.home,
          ),
          NavigationContent(
            title: "Dashboard",
            icon: Icons.dashboard,
          ),
          NavigationContent(
            title: "Profile",
            icon: Icons.person,
          ),
        ],
        builder: (context, index) {
          return TextView(
            flex: 1,
            background: Colors.red.withAlpha(50),
            text: "$index",
            textColor: Colors.black,
            textSize: 32,
            gravity: Alignment.center,
          );
        },
      ),
    );
  }
}
