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
      home: const HomeActivity(),
    );
  }
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),
      body: ContentView(
        scrollable: true,
        paddingVertical: 12,
        paddingHorizontal: 24,
        header: "Introduction",
        description: PrivacyContent.none.body,
        paragraphs: PrivacyContent.values
            .getRange(1, PrivacyContent.values.length)
            .map((e) {
          return Content(title: e.title, body: e.body);
        }).toList(),
        paragraphStyle: const ContentStyle(
          textSize: 14,
          textColor: Colors.black,
          textAlign: TextAlign.justify,
        ),
        titleStyle: const ContentStyle(
          textSize: 16,
          textColor: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
