import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_andomie/core.dart';
import 'package:flutter_androssy/core.dart';

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
      title: "Edit Layout",
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends AndrossyActivity<HomeController> {
  const Home({super.key});

  @override
  HomeController init(BuildContext context) => HomeController();

  @override
  AppBar? onCreateAppbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: TextView(
        text: "Edit Layout",
        textSize: 20,
        textColor: context.primaryColor,
        textFontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget onCreate(BuildContext context) {
    return EditLayout(
      scrollable: true,
      padding: 40,
      width: double.infinity,
      height: double.infinity,
      layoutGravity: LayoutGravity.center,
      children: [
        const TextView(
          text: "Sign up",
          textColor: Colors.black,
          textFontWeight: FontWeight.bold,
          textSize: 24,
        ),
        EditText(
          autoDisposeMode: false,
          controller: controller.etEmail,
          marginTop: 24,
          hint: "Email",
          text: "example@gmail.com",
          textSize: 18,
          inputType: TextInputType.emailAddress,
          onValidator: Validator.isValidEmail,
        ),
        EditText(
          autoDisposeMode: false,
          controller: controller.etPassword,
          marginTop: 24,
          hint: "Password",
          text: "123456",
          digits: "1234567890",
          inputType: TextInputType.visiblePassword,
          drawableEndAsEye: true,
          drawableEndState: const ValueState(
            primary: Icons.visibility_off_outlined,
            secondary: Icons.visibility_outlined,
          ),
          onValidator: (value) => value.length > 5,
        ),
        EditText(
          autoDisposeMode: false,
          controller: EditTextController(),
          marginTop: 24,
          hint: "Confirm password",
          text: "123456",
          digits: "1234567890",
          inputType: TextInputType.visiblePassword,
          drawableEndAsEye: true,
          drawableEndState: const ValueState(
            primary: Icons.visibility_off_outlined,
            secondary: Icons.visibility_outlined,
          ),
          onValidator: (value) => controller.isValidConfirmPassword(value),
        ),
        EditLayout(
          controller: EditLayoutController(),
          width: double.infinity,
          marginTop: 24,
          orientation: Axis.horizontal,
          children: [
            EditText(
              autoDisposeMode: false,
              controller: EditTextController(),
              flex: 1,
              hint: "Age",
              digits: "1234567890",
              onValidator: (value) => (int.tryParse(value) ?? 0) > 18,
            ),
            16.w,
            EditText(
              autoDisposeMode: false,
              controller: EditTextController(),
              flex: 1,
              hint: "Gender",
              onValidator: (value) {
                return ["Male", "Female", "Other"].contains(value);
              },
            ),
          ],
        ),
        Button(
          controller: controller.btnSubmit,
          marginTop: 50,
          width: double.infinity,
          height: 50,
          borderRadius: 12,
          text: "Submit",
        ),
      ],
    );
  }
}

class HomeController extends AndrossyController {
  final etEmail = EditTextController();
  final etPassword = EditTextController();
  final btnSubmit = ButtonController();

  @override
  void onListener(BuildContext context) {
    btnSubmit.setOnClickListener(onRegister);
  }

  @override
  void onDestroy(BuildContext context) {
    etEmail.dispose();
    etPassword.dispose();
    super.onDestroy(context);
  }

  bool isValidConfirmPassword(String? value) {
    final password = etPassword.text;
    return value == password;
  }

  void onRegister(BuildContext context) {
    final email = etEmail.text;
    final password = etPassword.text;
    log("onRegister {$email, $password}");
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return const Home();
    }));
  }
}
