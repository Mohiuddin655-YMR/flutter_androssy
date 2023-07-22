import 'package:flutter/cupertino.dart';
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
      body: NavigationView(
        positionType: ViewPositionType.bottom,
        background: Colors.white,
        paddingVertical: 12,
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
        items: const [
          NavigationItem(
            title: "Home",
            icon: Icons.home,
          ),
          NavigationItem(
            title: "Notification",
            icon: Icons.notifications,
          ),
          NavigationItem(
            title: "Profile",
            icon: Icons.person,
          ),
        ],
        builder: (context, index) {
          return NullableView(
            icon: CupertinoIcons.conversation_bubble,
            iconTint: context.primaryColor,
            header: "No results yet",
            body: "Currently no results available.",
            buttonText: "Add to new",
            buttonVisible: true,
            onButtonClick: (context) {},
          );
        },
      ),
    );
  }
}
