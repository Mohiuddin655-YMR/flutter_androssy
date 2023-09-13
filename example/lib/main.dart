import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

Future<void> main() async {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Androssy",
      home: Scaffold(
        body: Center(
          child: LinearLayout(
            children: [
              IconView(
                icon: Icons.edit,
                padding: 24,
                size: 100,
                shape: ViewShape.squire,
                borderRadius: 24,
                tint: Colors.orange,
                rippleColor: Colors.black,
                hoverColor: Colors.transparent,
                backgroundState: ValueState(
                  ternary: Colors.red.withOpacity(0.1),
                  primary: Colors.orange.withOpacity(0.1),
                  secondary: Colors.orange,
                ),
                tintState: ValueState(
                  primary: Colors.orange,
                  secondary: Colors.white,
                  ternary: Colors.red,
                ),
                onClick: (c) {
                  c.logValue;
                },
                onHover: (c) {
                  c.logValue;
                },
              ),
              IconView(
                marginTop: 24,
                icon: Icons.edit,
                padding: 24,
                size: 100,
                shape: ViewShape.circular,
                tint: Colors.orange,
                rippleColor: Colors.black,
                backgroundState: ValueState(
                  ternary: Colors.red.withOpacity(0.1),
                  primary: Colors.orange.withOpacity(0.1),
                  secondary: Colors.orange,
                ),
                tintState: ValueState(
                  primary: Colors.orange,
                  secondary: Colors.white,
                  ternary: Colors.red,
                ),
                onClick: (c) {
                  c.logValue;
                },
                onHover: (c) {
                  c.logValue;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
