import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:flutter_app_navigator/app_navigator.dart';

import '../../../index.dart';

class AuthSignInController extends AndrossyController {
  /// Edit fields
  EditTextController etEmail = EditTextController();
  EditTextController etPassword = EditTextController();

  /// Buttons
  ButtonController btnSubmit = ButtonController();
  ButtonController btnGoogle = ButtonController();
  ButtonController btnGithub = ButtonController();
  LinearLayoutController btnApiDocs = LinearLayoutController();
  TextViewController btnRegister = TextViewController();

  @override
  void onListener(BuildContext context) {
    btnApiDocs.setOnClickListener((context) {
      "API docs button is called".logValue;
    });
    btnSubmit.setOnClickListener((context) {
      "Submit button is called".logValue;
    });
    btnGoogle.setOnClickListener((context) {
      "Google button is called".logValue;
    });

    btnGithub.setOnClickListener((context) {
      "Github button is called".logValue;
    });
    btnRegister.setOnClickListener((context) {
      AppNavigator.of(context).go(
        AuthActivity.route,
        path: AuthSignUpFragment.route,
        queryParams: {"back": "true"},
      );
    });
  }
}
