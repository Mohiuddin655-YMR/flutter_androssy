import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/widgets.dart';

class AppEditText extends StatelessWidget {
  final EditTextController controller;
  final double? marginTop;
  final String? title;
  final String hint;
  final String? text;
  final TextInputType? inputType;

  const AppEditText({
    super.key,
    required this.controller,
    this.title,
    required this.hint,
    this.text,
    this.marginTop = 24,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TitledView(
      marginTop: marginTop,
      width: double.infinity,
      title: title,
      titleFontWeight: FontWeight.w600,
      titleColor: Colors.grey.shade700,
      child: EditText(
        marginTop: 8,
        controller: controller,
        inputType: inputType,
        hint: hint,
        text: text,
        borderRadius: 6,
        borderSizeState: const ValueState(
          primary: 1,
          secondary: 1,
        ),
        borderColor: context.primaryColor,
        paddingHorizontal: 16,
        paddingVertical: 12,
      ),
    );
  }
}
