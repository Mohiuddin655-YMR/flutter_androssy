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
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  ButtonController button = ButtonController();
  CountdownViewController controller = CountdownViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextView"),
      ),
      body: LinearLayout(
        padding: 24,
        scrollable: true,
        paddingBottom: 40,
        children: [
          TextView(
            text: "1313670655 ",
            textColor: Colors.grey,
            prefixText: "+880 ",
            prefixTextState: ValueState.active(
              activated: "activated",
              inactivated: "inactivated",
            ),
            suffixTextState: ValueState.active(
              activated: "activated",
              inactivated: "inactivated",
            ),
            prefixTextColor: Colors.red,
            prefixFontWeight: FontWeight.w500,
            suffixText: "(BD)",
            onToggle: (v) {},
          ),
          // CountdownView(
          //   initialStartMode: false,
          //   controller: controller,
          //   builder: (context, timer) {
          //     return TextView(
          //       text: "${timer.minutes.x2D}:${timer.seconds.x2D}",
          //     );
          //   },
          // ),
          // EditForm(
          //   marginTop: 24,
          //   onValid: button.setEnabled,
          //   children: [
          //     EditText(
          //       marginTop: 24,
          //       id: "email",
          //       hint: "Email",
          //       inputType: TextInputType.emailAddress,
          //       background: context.primaryColor.withAlpha(50),
          //       paddingHorizontal: 24,
          //       paddingVertical: 0,
          //       borderRadius: 12,
          //       onValidator: (v) {
          //         return v.contains("a");
          //       },
          //     ),
          //     EditText(
          //       marginTop: 24,
          //       id: "password",
          //       hint: "Password",
          //       inputType: TextInputType.datetime,
          //       onValidator: (v) {
          //         return v.contains("1");
          //       },
          //     ),
          //   ],
          // ),
          // MaterialEditForm(
          //   marginTop: 24,
          //   onValid: button.setEnabled,
          //   children: [
          //     MaterialEditText(
          //       marginTop: 24,
          //       id: "email",
          //       autoFocus: true,
          //       primary: Colors.blue,
          //       hint: "Email",
          //       drawablePadding: 24,
          //       maxCharacters: 15,
          //       minCharacters: 10,
          //       counterVisible: true,
          //       helperText: "abc@gmail.com",
          //       textSize: 18,
          //       floatingLabelVisible: true,
          //       inputType: TextInputType.emailAddress,
          //       onValidator: (v) {
          //         return v.contains("abc@gmail.com");
          //       },
          //       onError: (v) {
          //         return v.isEmpty ? "" : "Not matched by abc@gmail.com";
          //       },
          //     ),
          //     MaterialEditText(
          //       marginTop: 24,
          //       id: "password",
          //       autoFocus: true,
          //       counterVisible: true,
          //       primary: Colors.blue,
          //       hint: "Password",
          //       drawablePadding: 24,
          //       textSize: 18,
          //       floatingLabelVisible: true,
          //       inputType: TextInputType.visiblePassword,
          //       onValidator: (v) {
          //         return v.contains("123456");
          //       },
          //       onError: (v) {
          //         return v.isEmpty ? "" : "Not matched by 123456";
          //       },
          //     ),
          //   ],
          // ),
          // Button(
          //   width: double.infinity,
          //   marginTop: 24,
          //   controller: button,
          //   text: "Sign in",
          //   enabled: true,
          //   onToggle: (value) {
          //     if (value) {
          //       controller.onStart();
          //     } else {
          //       controller.onStop();
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
