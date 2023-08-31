import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../../index.dart';

class AuthSignInFragment extends BaseFragment<AuthSignInController> {
  static String route = "sign_in";

  const AuthSignInFragment({
    super.key,
    required super.instance,
  });

  @override
  AuthSignInController init(BuildContext context) {
    return AuthSignInController();
  }

  @override
  Widget onCreate(context, controller) {
    return LinearLayout(
      width: double.infinity,
      layoutGravity: LayoutGravity.center,
      children: [
        ToolbarView(
          width: double.infinity,
          background: Colors.white,
          paddingHorizontal: kIsWeb ? 54 : null,
          paddingVertical: kIsWeb ? 24 : null,
          titleCenter: false,
          titleCustom: ImageView(
            image: AppContents.logoHorizontal,
            tint: context.primaryColor,
            height: 24,
          ),
          actions: [
            LinearLayout(
              controller: controller.btnApiDocs,
              rippleColor: Colors.black12,
              orientation: Axis.horizontal,
              crossGravity: CrossAxisAlignment.center,
              background: context.primaryColor,
              borderRadius: 8,
              paddingHorizontal: 24,
              paddingVertical: 8,
              marginEnd: 16,
              children: [
                const TextView(
                  text: "API docs",
                  textColor: Colors.white,
                ),
                IconView(
                  marginStart: 8,
                  icon: AppContents.icApiDocRegular,
                  size: 18,
                  tint: Colors.white,
                ),
              ],
            ),
          ],
        ),
        const Divider(height: 1, color: Colors.transparent),
        LinearLayout(
          flex: 1,
          width: double.infinity,
          widthMax: 500,
          background: Colors.white,
          scrollable: true,
          layoutGravity: LayoutGravity.center,
          paddingHorizontal: 54,
          paddingVertical: 54,
          children: [
            ImageView(
              image: AppContents.logoVertical,
              tint: context.primaryColor,
              height: 90,
              margin: 24,
            ),
            AppEditText(
              controller: controller.etEmail,
              hint: "Enter your email",
              title: "Email",
              inputType: TextInputType.emailAddress,
            ),
            AppEditText(
              controller: controller.etPassword,
              hint: "Enter your password",
              title: "Password",
              inputType: TextInputType.visiblePassword,
            ),
            PrimaryButton(
              controller: controller.btnSubmit,
              marginTop: 40,
              text: "Log In",
            ),
            const AppOrText(),
            AppOAuthButton(
              controller: controller.btnGoogle,
              text: "Sign up with Google",
              icon: AppContents.icGoogle,
            ),
            AppOAuthButton(
              controller: controller.btnGithub,
              text: "Sign up with Github",
              icon: AppContents.icGithub,
            ),
            AuthCreateAccountTextButton(
              controller: controller.btnRegister,
            ),
          ],
        ),
      ],
    );
  }
}
