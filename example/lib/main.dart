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
    var theme = Theme.of(context);
    var a = theme.textTheme.titleLarge;
    var b = theme.textTheme.titleSmall;
    return Scaffold(
      body: SplashView(
        bodyY: 5,
        title: "Flutter K",
        titleColor: a?.color,
        titleSize: a?.fontSize,
        subtitle: "This is a flutter app description",
        subtitleColor: b?.color,
        logo: "assets/images/img_logo.png",
        logoRadius: 20,
        logoSize: 90,
        //onExecute: () => _loadScreens(context),
        bottom: const TextView(
          text: 'Powered by YMR',
          marginBottom: 40,
          textColor: Colors.grey,
        ),
      ),
    );
  }

  Future<bool> isAvailable(String v) async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }
}
