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
        width: double.infinity,
        height: double.infinity,
        gravity: Alignment.center,
        layoutGravity: LayoutGravity.center,
        paddingHorizontal: 24,
        paddingVertical: 24,
        children: [
          YMRView(
            borderRadius: 24,
            marginTop: 24,
            width: 200,
            height: 200,
            enabled: true,
            background: context.primaryColor,
            rippleColor: Colors.black.withOpacity(0.2),
            pressedColor: Colors.black.withOpacity(0.2),
            onClick: (context){},
          ),
          YMRView(
            borderRadius: 24,
            marginTop: 24,
            width: 200,
            height: 200,
            borderColor: context.primaryColor,
            border: 2,
            rippleColor: Colors.black.withOpacity(0.2),
            pressedColor: Colors.black.withOpacity(0.2),
            onClick: (context){},
          ),
        ],
      ),
    );
  }
}
