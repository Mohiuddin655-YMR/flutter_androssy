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

class Example extends StatefulWidget {
  const Example({
    super.key,
  });

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    var a = double.infinity - 8;
    a.logValue;
    return Scaffold(
      body: RecyclerView(
        orientation: Axis.horizontal,
        spaceBetween: 8,
        background: Colors.green.withAlpha(50),
        wrapper: true,
        items: List.generate(12, (index) => "Item $index"),
        snapCount: 3,
        builder: (index, item) {
          return TextView(
            paddingVertical: 24,
            gravity: Alignment.center,
            background: index.isEven ? context.primaryColor : Colors.red,
            text: item,
          );
        },
      ),
    );
  }

  Future<bool> isAvailable(String v) async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }
}
