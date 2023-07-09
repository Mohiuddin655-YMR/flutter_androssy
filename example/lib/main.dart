import 'package:example/home/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

import 'privacy_contents.dart';

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

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextView"),
      ),
      body: const Center(
        child: TextView(
          text: "৳600 - ",
          textSize: 14,
          textColor: Colors.black,
          textSpans: [
            TextSpan(
              text: "৳500",
              style: TextStyle(
                color: Colors.purpleAccent,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.purpleAccent,
                decorationThickness: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
