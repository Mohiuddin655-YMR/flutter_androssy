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
    return Scaffold(
      body: LinearLayout(
        children: [
          RecyclerView(
            controller: RecyclerViewController(),
            flex: 1,
            orientation: Axis.vertical,
            padding: 24,
            scrollable: true,
            wrapper: false,
            items: List.generate(150, (index) => "Item $index"),
            snapCount: 7,
            builder: (index, item) {
              return TextView(
                padding: 40,
                gravity: Alignment.center,
                background: index.isEven ? context.primaryColor : Colors.red,
                text: item,
                paddingVertical: 3,
              );
            },
          ),
        ],
      ),
    );
  }

  Future<bool> isAvailable(String v) async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }
}
