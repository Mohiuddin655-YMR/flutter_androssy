import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/widgets.dart';

void main() {
  runApp(AndrossyProvider(
    child: const Application(),
  ));
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

class Example extends AndrossyActivity<ExampleController> {
  const Example({
    super.key,
  });

  @override
  ExampleController init(BuildContext context) {
    return ExampleController();
  }

  @override
  Widget onCreate(context, instance) {
    return LinearLayout(
      width: double.infinity,
      height: double.infinity,
      layoutGravity: LayoutGravity.center,
      paddingHorizontal: 24,
      children: [
        TextView(text: instance.preferences.toString()),
        EditText(
          inputType: TextInputType.emailAddress,
          marginTop: 24,
          hint: "Email",
          drawableStartState: const ValueState(
            primary: Icons.email_outlined,
            secondary: Icons.email,
          ),
          paddingHorizontal: 12,
          borderColor: context.primaryColor,
          borderSizeState: const ValueState(
            primary: 1,
            secondary: 2,
          ),
          borderRadiusState: const ValueState(
            primary: 24,
            secondary: 12,
          ),
          borderColorState: ValueState(
            primary: Colors.grey,
            secondary: context.primaryColor,
          ),
        ),
        const EditText(
          inputType: TextInputType.visiblePassword,
          marginTop: 24,
          hint: "Password",
          textSize: 18,
          drawableStartState: ValueState(
            primary: Icons.lock_outline,
            secondary: Icons.lock,
          ),
          drawableEndState: ValueState(
            primary: Icons.lock_outline,
            secondary: Icons.lock,
          ),
          floatingLabelVisible: true,
          helperText: "Nice",
        ),
        Button(
          marginTop: 24,
          borderRadius: 24,
          text: "Click",
          rippleColor: Colors.black12,
          onToggle: (value) {
            instance.preferences.logValue.setString("key", "My name is Omie");
            controller.setText(controller.text == "Hi" ? "Hello" : "Hi");
          },
        ),
      ],
    );
  }
}

class ExampleController extends AndrossyController {
  String text = "Hi";
  Offset offset = Offset.zero;

  void setText(String value) {
    onNotify(() {
      text = value;
    });
  }
}
