import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

class AppOrText extends StatelessWidget {
  const AppOrText({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextView(
      marginTop: 24,
      text: "or",
      textSize: 16,
      textColor: Colors.black,
    );
  }
}
