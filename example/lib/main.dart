import 'dart:developer';

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
      debugShowCheckedModeBanner: false,
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
      body: Center(
        child: Button(
          paddingHorizontal: 50,
          paddingVertical: 50,
          borderRadius: 24,
          ripple: 50,
          margin: 24,
          text: "Click",
          textSize: 14,
          onClick: (c){},
          widthState: ValueState(
            primary: 100,
            hover: 200,
          ),
          backgroundState: ValueState(
            primary: Colors.green,
            hover: context.primaryColor,
            activate: Colors.black,
          ),
        ),
      ),
    );
  }
}
