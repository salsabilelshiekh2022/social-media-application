import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_app/core/routing/routes.dart';
import 'package:social_media_app/core/utils/extensions.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const AppTextFormField(
            hintText: "Email",
            keyBoardType: TextInputType.emailAddress,
            prefixIcon: Icons.email_rounded,
          ),
          verticalSpace(24),
          const AppTextFormField(
            hintText: "Password",
            secure: true,
            prefixIcon: FontAwesomeIcons.lock,
            suffixIcon: true,
          ),
          verticalSpace(48),
          AppButton(title: 'Sign in ', onTap: () {}),
          verticalSpace(24),
          TextButton(
            onPressed: () {
              context.pushNamed(Routes.forgotPasswordMethodView);
            },
            child: Text(
              'Forgot Password?',
              style: AppTextStyle.font16MainColorSemiBold,
            ),
          ),
          verticalSpace(45),
        ],
      ),
    );
  }
}
