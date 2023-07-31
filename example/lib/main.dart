import 'package:example/et.dart';
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

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LinearLayout(
        layoutGravity: LayoutGravity.center,
        paddingHorizontal: 24,
        paddingVertical: 24,
        children: [
          ET(
            hint: "Email",
            paddingVertical: 12,
            enabled: true,
            paddingHorizontal: 16,
          ),
          ExEditText(
            hint: 'Email',
            drawableStart: MaterialIconData(
              active: Icons.email,
              inactive: Icons.email_outlined,
            ),
            onExecute: isAvailable,
            onValidator: (v) {
              return v.contains("123");
            },
          ),
          SizedBox(
            height: 24,
          ),
          MaterialEditText(
            hint: 'Password',
            drawableStart: MaterialIconData(
              active: Icons.lock,
              inactive: Icons.lock_outline,
            ),
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
