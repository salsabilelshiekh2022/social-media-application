import 'package:flutter/material.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/congratulation_alert.dart';
import 'pick_image_widget.dart';
import 'skip_button_and_continue_button.dart';

class FillYourProfileForm extends StatelessWidget {
  const FillYourProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        const PickImageWidget(),
        verticalSpace(24),
        const AppTextFormField(
          hintText: 'Full Name',
          prefixIcon: Icons.person,
        ),
        verticalSpace(24),
        const AppTextFormField(
          hintText: 'Nick Name',
          prefixIcon: Icons.person,
        ),
        verticalSpace(24),
        const AppTextFormField(
          hintText: 'Email',
          prefixIcon: Icons.email,
        ),
        verticalSpace(24),
        const AppTextFormField(
          hintText: 'Phone',
          prefixIcon: Icons.phone,
        ),
        verticalSpace(185),
        SkipButtonAndContinueButton(
          continueMethod: () {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => const CongratulationAlart());
          },
          skipMethod: () {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => const CongratulationAlart());
          },
        )
      ]),
    );
  }
}
