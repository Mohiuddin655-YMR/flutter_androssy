import 'package:example/ex_edit_text.dart';
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
        layoutGravity: LayoutGravity.center,
        paddingHorizontal: 24,
        paddingVertical: 24,
        children: [
          EditText(
            autoFocus: true,
            hint: "Email",
          ),
          const SizedBox(height: 24),
          ExEditText(
            hint: "Password",
            hintColor: Colors.redAccent,
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
