import 'package:flutter/material.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';

class AuthHaveAccountTextButton extends StatelessWidget {
  final TextViewController? controller;
  final OnViewClickListener? onClick;

  const AuthHaveAccountTextButton({
    super.key,
    this.controller,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return TextView(
      controller: controller,
      marginTop: 24,
      text: "Have an account? ",
      textColor: Colors.black,
      suffixText: "Log in",
      suffixTextDecoration: TextDecoration.underline,
      suffixTextDecorationThickness: 2,
      suffixTextDecorationStyle: TextDecorationStyle.solid,
      suffixTextDecorationColor: Colors.grey,
      onSuffixClick: onClick,
    );
  }
}
