import 'package:flutter/material.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';

class AuthCreateAccountTextButton extends StatelessWidget {
  final TextViewController? controller;
  final OnViewClickListener? onClick;

  const AuthCreateAccountTextButton({
    super.key,
    this.controller,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return TextView(
      controller: controller,
      marginTop: 24,
      text: "Not register? ",
      textColor: Colors.black,
      suffixText: "Create account",
      suffixTextDecoration: TextDecoration.underline,
      suffixTextDecorationThickness: 2,
      suffixTextDecorationStyle: TextDecorationStyle.solid,
      suffixTextDecorationColor: Colors.grey,
      onSuffixClick: onClick,
    );
  }
}
