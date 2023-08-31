import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:flutter_app_navigator/app_navigator.dart';

import '../../../index.dart';

class AuthSignUpFragment extends BaseFragment<AuthSignUpController> {
  static String route = "sign_up";

  const AuthSignUpFragment({
    super.key,
    required super.instance,
  });

  @override
  AuthSignUpController init(BuildContext context) {
    return AuthSignUpController();
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
            CheckmarkView(
              controller: controller.cvPrivacy,
              marginTop: 24,
              checked: true,
              textSize: 16,
              checkboxAlignment: CheckboxAlignment.leftTop,
              text: "By creating an account, you agree to our ",
              textSpans: [
                TextSpan(
                  text: "Terms of Service ",
                  style: TextStyle(
                    color: context.primaryColor,
                  ),
                ),
                const TextSpan(
                  text: "and ",
                ),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                    color: context.primaryColor,
                  ),
                ),
              ],
            ),
            PrimaryButton(
              controller: controller.btnSubmit,
              marginTop: 40,
              text: "Register",
              onClick: (context) {},
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
            AuthHaveAccountTextButton(
              controller: controller.btnSignIn,
            ),
          ],
        ),
      ],
    );
  }
}
