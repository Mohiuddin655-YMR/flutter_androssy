import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../../../../index.dart';

class HomeDrawerFooter extends StatelessWidget {
  final OnViewClickListener? onSignIn, onSignUp;
  final String Function(String value) translate;

  const HomeDrawerFooter({
    super.key,
    required this.translate,
    this.onSignIn,
    this.onSignUp,
  });

  @override
  Widget build(BuildContext context) {
    return LinearLayout(
      width: double.infinity,
      paddingHorizontal: 24,
      paddingTop: 8,
      paddingBottom: 24,
      children: [
        TextView(
          text: translate("For better experience please login or register"),
          textStyle: context.textTheme.titleSmall,
        ),
        PrimaryButton(
          marginTop: 16,
          text: translate("Log in"),
          onClick: onSignIn,
        ),
        SecondaryButton(
          marginTop: 16,
          text: translate("Sign up"),
          onClick: onSignUp,
        ),
      ],
    );
  }
}
