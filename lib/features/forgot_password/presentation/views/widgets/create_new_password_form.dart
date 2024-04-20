import 'package:flutter/material.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class CreateNewPasswordForm extends StatelessWidget {
  const CreateNewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        verticalSpace(24),
        const AppTextFormField(
          hintText: 'Password',
          secure: true,
          prefixIcon: Icons.lock,
          suffixIcon: true,
        ),
        verticalSpace(24),
        const AppTextFormField(
          hintText: 'Confirm Password',
          secure: true,
          prefixIcon: Icons.lock,
          suffixIcon: true,
        ),
      ]),
    );
  }
}
