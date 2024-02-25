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
  HomeController init(BuildContext context) {
    return HomeController();
  }

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
      onValid: controller.btnSubmit.setEnabled,
      children: [
        EditLayout(
          visibility: false,
          width: double.infinity,
          marginTop: 24,
          onValid: controller.btnSubmit.setEnabled,
          orientation: Axis.horizontal,
          crossGravity: CrossAxisAlignment.end,
          children: [
            EditText(
              flex: 1,
              controller: controller.etDay,
              gravity: Alignment.center,
              textAlign: TextAlign.center,
              hint: "Day",
              helperText: "12",
              helperTextColor: context.primaryColor,
              inputType: TextInputType.number,
              maxCharacters: 2,
              minCharacters: 1,
              maxCharactersAsLimit: true,
              textSize: 18,
              floatingVisibility: FloatingVisibility.auto,
            ),
            const SizedBox(width: 4),
            EditText(
              flex: 1,
              controller: controller.etMonth,
              gravity: Alignment.center,
              textAlign: TextAlign.center,
              hint: "Month",
              helperText: "Jan",
              helperTextColor: context.primaryColor,
              inputType: TextInputType.number,
              maxCharacters: 2,
              minCharacters: 1,
              maxCharactersAsLimit: true,
              textSize: 18,
              floatingVisibility: FloatingVisibility.auto,
            ),
            const SizedBox(width: 4),
            EditText(
              flex: 1,
              controller: controller.etYear,
              gravity: Alignment.center,
              textAlign: TextAlign.center,
              hint: "Year",
              helperText: "2000",
              helperTextColor: context.primaryColor,
              inputType: TextInputType.number,
              maxCharacters: 4,
              minCharacters: 4,
              maxCharactersAsLimit: true,
              textSize: 18,
              floatingVisibility: FloatingVisibility.auto,
            ),
          ],
        ),
        EditLayout(
          marginTop: 24,
          children: [
            Container(
              color: Colors.green.shade50,
              child: EditText(
                autoDisposeMode: false,
                hint: "أدخل النص الخاص بك...؟",
                floatingVisibility: FloatingVisibility.always,
                counterVisibility: FloatingVisibility.always,
                textDirection: TextDirection.ltr,
                floatingTextSpace: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 4,
                  bottom: 4,
                ),
                // marginTop: 8,
                paddingHorizontal: 16,
                paddingVertical: 16,
                borderRadius: 16,
                inputType: TextInputType.name,
                borderColorState: ValueState(
                  primary: context.primaryColor.withOpacity(0.1),
                  secondary: context.primaryColor,
                  disable: context.errorColor.withOpacity(0.25),
                ),
                borderSizeState: const ValueState(
                  primary: 1.5,
                  secondary: 2,
                ),
                maxCharacters: 30,
                minCharacters: 5,
                maxCharactersAsLimit: false,
                background: Colors.transparent,
                drawableStartState: const ValueState(
                  primary: Icons.person_outline_rounded,
                  secondary: Icons.person_rounded,
                ),
                drawableEndState: const ValueState(
                  primary: null,
                  valid: Icons.check,
                  error: Icons.clear,
                ),
                drawableStartPadding: 12,
                drawableEndPadding: 0,
                onValidator: (value) {
                  return value.length > 4 && value.length < 31;
                },
                onValid: (v) {
                  log("VALID: $v");
                },
                onError: (type) {
                  log("ON ERROR : $type");
                  if (type.isMinimum) {
                    return "Minimum error";
                  } else if (type.isMaximum) {
                    return "Maximum error";
                  } else if (type.isAlreadyFound) {
                    return "Unavailable";
                  } else {
                    return null;
                  }
                },
                onActivator: (recall, value) async {
                  await Future.delayed(const Duration(seconds: 2));
                  final isNotFound = value != "123456";
                  return isNotFound;
                },
              ),
            ),
          ],
        ),
        EditText(
          controller: controller.etEmail,
          marginTop: 24,
          counterVisibility: FloatingVisibility.auto,
          helperText: "nice",
          textAlign: TextAlign.center,
          maxCharacters: 50,
          hint: "Email",
          text: "example@gmail.com",
          textSize: 18,
          inputType: TextInputType.emailAddress,
          onValidator: Validator.isValidEmail,
        ),
        EditText(
          controller: controller.etPassword,
          marginTop: 24,
          hint: "Password",
          text: "123456",
          characters: "1234567890",
          inputType: TextInputType.visiblePassword,
          drawableEndAsEye: true,
          drawableEndState: const ValueState(
            primary: Icons.visibility_off_outlined,
            secondary: Icons.visibility_outlined,
          ),
          onValidator: (value) => value.length > 5,
        ),
        EditText(
          controller: EditTextController(),
          marginTop: 24,
          hint: "Confirm password",
          text: "123456",
          characters: "1234567890",
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
              controller: EditTextController(),
              flex: 1,
              hint: "Age",
              characters: "1234567890",
              onValidator: (value) => (int.tryParse(value) ?? 0) > 18,
            ),
            16.w,
            EditText(
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
          enabled: false,
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

  final etDay = EditTextController();
  final etMonth = EditTextController();
  final etYear = EditTextController();

  @override
  void onListener(BuildContext context) {
    btnSubmit.setOnClickListener(onRegister);
  }

  bool isValidConfirmPassword(String? value) {
    final password = etPassword.text;
    return value == password;
  }

  void onRegister(BuildContext context) {
    final email = etEmail.text;
    final password = etPassword.text;
    log("onRegister {$email, $password}");
  }
}
