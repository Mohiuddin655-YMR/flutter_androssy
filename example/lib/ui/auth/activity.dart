import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../index.dart';

class AuthActivity extends BaseActivity<AuthActivityController> {
  static const String route = "/auth";
  final bool isFromWelcome;
  final AuthScreenType? type;

  const AuthActivity({
    super.key,
    this.isFromWelcome = false,
    super.hideToolbar = true,
    this.type,
  });

  @override
  AuthActivityController init(BuildContext context) {
    return AuthActivityController();
  }

  @override
  AndrossyScreenConfig config(BuildContext context) {
    return super
        .config(context)
        .copyWith(backgroundColor: kIsWeb ? Colors.white : null);
  }

  @override
  Widget onCreate(context, instance) {
    switch (type ?? AuthScreenType.signIn) {
      case AuthScreenType.signUp:
        return AuthSignUpFragment(instance: instance);
      default:
        return AuthSignInFragment(instance: instance);
    }
  }
}
