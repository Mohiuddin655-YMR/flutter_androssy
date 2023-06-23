import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LinearLayout(
      gravity: Alignment.center,
      layoutGravity: LayoutGravity.center,
      children: [
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
