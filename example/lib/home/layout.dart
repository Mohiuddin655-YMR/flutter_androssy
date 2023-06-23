import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({
    super.key,
  });

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return LinearLayout(
      gravity: Alignment.center,
      layoutGravity: LayoutGravity.center,
      onClick: (c) {
        setState(() {});
      },
      children: const [
        TextView(
          text: "Home",
          textColor: Colors.black,
          textSize: 24,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
