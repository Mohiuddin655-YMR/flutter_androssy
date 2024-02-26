import 'dart:developer';

import 'package:flutter/cupertino.dart';
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
          width: double.infinity,
          marginTop: 24,
          orientation: Axis.horizontal,
          crossGravity: CrossAxisAlignment.end,
          children: [
            EditText(
              flex: 1,
              controller: controller.etDay,
              floatingAlignment: Alignment.centerLeft,
              textAlign: TextAlign.start,
              hint: "Day",
              text: "2",
              helperText: "02",
              helperTextColor: context.primaryColor,
              inputType: TextInputType.number,
              maxCharacters: 2,
              minCharacters: 1,
              maxCharactersAsLimit: true,
              textSize: 18,
              floatingVisibility: FloatingVisibility.auto,
              onValidator: (value) {
                final day = int.tryParse(value) ?? 0;
                if (day <= 31 && day > 0) {
                  return true;
                } else {
                  return false;
                }
              },
            ),
            const SizedBox(width: 4),
            EditText(
              flex: 1,
              controller: controller.etMonth,
              gravity: Alignment.center,
              textAlign: TextAlign.center,
              hint: "Month",
              text: "1",
              helperText: "Jan",
              helperTextColor: context.primaryColor,
              inputType: TextInputType.number,
              maxCharacters: 2,
              minCharacters: 1,
              maxCharactersAsLimit: true,
              textSize: 18,
              floatingVisibility: FloatingVisibility.auto,
              onValidator: (value) {
                final month = int.tryParse(value) ?? 0;
                if (month <= 12 && month > 0) {
                  return true;
                } else {
                  return false;
                }
              },
            ),
            const SizedBox(width: 4),
            EditText(
              flex: 1,
              controller: controller.etYear,
              floatingAlignment: Alignment.centerRight,
              textAlign: TextAlign.end,
              hint: "Year",
              text: "2024",
              helperText: "2024",
              helperTextColor: context.primaryColor,
              inputType: TextInputType.number,
              maxCharacters: 4,
              minCharacters: 4,
              maxCharactersAsLimit: true,
              textSize: 18,
              floatingVisibility: FloatingVisibility.auto,
              onValidator: (value) {
                final mYear = DateTime.timestamp().year;
                final year = int.tryParse(value) ?? 0;
                if (year <= mYear && year > 1950) {
                  return true;
                } else {
                  return false;
                }
              },
            ),
          ],
        ),
        EditText(
          marginTop: 24,
          autoDisposeMode: true,
          hint: "Enter your full name",
          text: "123456",
          floatingText: "Full Name",
          floatingVisibility: FloatingVisibility.always,
          counterVisibility: FloatingVisibility.always,
          textDirection: TextDirection.ltr,
          floatingTextSpace: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 4,
            bottom: 4,
          ),
          paddingHorizontal: 16,
          paddingVertical: 16,
          borderRadius: 16,
          inputType: TextInputType.name,
          inputAction: TextInputAction.done,
          borderColorState: ValueState(
            primary: context.primaryColor.withOpacity(0.1),
            secondary: context.primaryColor,
            error: CupertinoColors.destructiveRed,
            valid: CupertinoColors.activeGreen,
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
          drawableStartTintState: ValueState(
            primary: context.primaryColor.withOpacity(0.5),
            secondary: context.primaryColor,
            error: CupertinoColors.destructiveRed,
            valid: CupertinoColors.activeGreen,
            disable: context.errorColor.withOpacity(0.25),
          ),
          drawableEndState: const ValueState(
            valid: Icons.check,
            error: Icons.error_outline,
          ),
          drawableEndTintState: ValueState(
            primary: Colors.grey,
            valid: context.primaryColor,
            error: Colors.redAccent,
          ),
          drawableStartPadding: 12,
          drawableEndPadding: 0,
          onActivator: (recall, value) async {
            if (!recall) await Future.delayed(const Duration(seconds: 2));
            final isNotFound = value != "123456";
            return isNotFound;
          },
          onError: (type) {
            if (type.isMinimum) {
              return "Minimum characters error!";
            } else if (type.isMaximum) {
              return "Maximum characters error!";
            } else if (type.isAlreadyFound) {
              return "Currently not available";
            } else {
              return null;
            }
          },
          onValid: (value) {
            log("VALID: $value");
          },
          onValidator: (value) => value.length > 4 && value.length < 31,
        ),
        EditText(
          marginTop: 24,
          autoDisposeMode: true,
          hint: "أدخل اسمك الكامل",
          text: "123456",
          floatingText: "الاسم الكامل",
          floatingVisibility: FloatingVisibility.always,
          counterVisibility: FloatingVisibility.always,
          textDirection: TextDirection.rtl,
          floatingTextSpace: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 4,
            bottom: 4,
          ),
          paddingHorizontal: 16,
          paddingVertical: 16,
          borderRadius: 16,
          inputType: TextInputType.name,
          inputAction: TextInputAction.done,
          borderColorState: ValueState(
            primary: context.primaryColor.withOpacity(0.1),
            secondary: context.primaryColor,
            error: CupertinoColors.destructiveRed,
            valid: CupertinoColors.activeGreen,
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
          drawableStartTintState: ValueState(
            primary: context.primaryColor.withOpacity(0.5),
            secondary: context.primaryColor,
            error: CupertinoColors.destructiveRed,
            valid: CupertinoColors.activeGreen,
            disable: context.errorColor.withOpacity(0.25),
          ),
          drawableEndState: const ValueState(
            valid: Icons.check,
            error: Icons.error_outline,
          ),
          drawableEndTintState: ValueState(
            primary: Colors.grey,
            valid: context.primaryColor,
            error: Colors.redAccent,
          ),
          drawableStartPadding: 12,
          drawableEndPadding: 0,
          onActivator: (recall, value) async {
            if (!recall) await Future.delayed(const Duration(seconds: 2));
            final isNotFound = value != "123456";
            return isNotFound;
          },
          onError: (type) {
            if (type.isMinimum) {
              return "خطأ الحد الأدنى للأحرف!";
            } else if (type.isMaximum) {
              return "الحد الأقصى لعدد الأحرف!";
            } else if (type.isAlreadyFound) {
              return "حاليا غير متوفر!";
            } else {
              return null;
            }
          },
          onValid: (value) {
            log("VALID: $value");
          },
          onValidator: (value) => value.length > 4 && value.length < 31,
        ),
        EditText(
          marginTop: 24,
          autoDisposeMode: true,
          hint: "Enter your full name",
          floatingText: "Full Name",
          floatingVisibility: FloatingVisibility.auto,
          counterVisibility: FloatingVisibility.auto,
          textDirection: TextDirection.ltr,
          inputType: TextInputType.name,
          inputAction: TextInputAction.done,
          maxCharacters: 30,
          minCharacters: 5,
          maxCharactersAsLimit: false,
          drawableStartState: const ValueState(
            primary: Icons.person_outline_rounded,
            secondary: Icons.person_rounded,
          ),
          drawableStartTintState: ValueState(
            primary: context.primaryColor.withOpacity(0.5),
            secondary: context.primaryColor,
            error: CupertinoColors.destructiveRed,
            valid: CupertinoColors.activeGreen,
            disable: context.errorColor.withOpacity(0.25),
          ),
          drawableEndState: const ValueState(
            valid: Icons.check,
            error: Icons.error_outline,
          ),
          drawableEndTintState: ValueState(
            primary: Colors.grey,
            valid: context.primaryColor,
            error: Colors.redAccent,
          ),
          underlineColorState: ValueState(
            primary: context.primaryColor.withOpacity(0.1),
            secondary: context.primaryColor,
            error: CupertinoColors.destructiveRed,
            valid: CupertinoColors.activeGreen,
            disable: context.errorColor.withOpacity(0.25),
          ),
          onActivator: (recall, value) async {
            if (!recall) await Future.delayed(const Duration(seconds: 2));
            final isNotFound = value != "123456";
            return isNotFound;
          },
          onError: (type) {
            if (type.isMinimum) {
              return "Minimum characters error!";
            } else if (type.isMaximum) {
              return "Maximum characters error!";
            } else if (type.isAlreadyFound) {
              return "Currently not available";
            } else {
              return null;
            }
          },
          onValid: (value) {
            log("VALID: $value");
          },
          onValidator: (value) => value.length > 4 && value.length < 31,
        ),
        EditText(
          marginTop: 8,
          autoDisposeMode: true,
          hint: "أدخل اسمك الكامل",
          floatingText: "الاسم الكامل",
          floatingVisibility: FloatingVisibility.auto,
          counterVisibility: FloatingVisibility.auto,
          textDirection: TextDirection.rtl,
          inputType: TextInputType.name,
          inputAction: TextInputAction.done,
          maxCharacters: 30,
          minCharacters: 5,
          maxCharactersAsLimit: false,
          drawableStartState: const ValueState(
            primary: Icons.person_outline_rounded,
            secondary: Icons.person_rounded,
          ),
          drawableStartTintState: ValueState(
            primary: context.primaryColor.withOpacity(0.5),
            secondary: context.primaryColor,
            error: CupertinoColors.destructiveRed,
            valid: CupertinoColors.activeGreen,
            disable: context.errorColor.withOpacity(0.25),
          ),
          drawableEndState: const ValueState(
            valid: Icons.check,
            error: Icons.error_outline,
          ),
          drawableEndTintState: ValueState(
            primary: Colors.grey,
            valid: context.primaryColor,
            error: Colors.redAccent,
          ),
          underlineColorState: ValueState(
            primary: context.primaryColor.withOpacity(0.1),
            secondary: context.primaryColor,
            error: CupertinoColors.destructiveRed,
            valid: CupertinoColors.activeGreen,
            disable: context.errorColor.withOpacity(0.25),
          ),
          onActivator: (recall, value) async {
            if (!recall) await Future.delayed(const Duration(seconds: 2));
            final isNotFound = value != "123456";
            return isNotFound;
          },
          onError: (type) {
            if (type.isMinimum) {
              return "خطأ الحد الأدنى للأحرف!";
            } else if (type.isMaximum) {
              return "الحد الأقصى لعدد الأحرف!";
            } else if (type.isAlreadyFound) {
              return "حاليا غير متوفر!";
            } else {
              return null;
            }
          },
          onValid: (value) {
            log("VALID: $value");
          },
          onValidator: (value) => value.length > 4 && value.length < 31,
        ),
        EditText(
          controller: controller.etEmail,
          marginTop: 24,
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
