import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_app/core/routing/routes.dart';
import 'package:social_media_app/core/utils/extensions.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

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
          AppButton(
              title: 'Sign up ',
              onTap: () {
                context.pushNamed(Routes.selectGenderView);
              }),
          verticalSpace(124),
        ],
      ),
    );
  }
}
