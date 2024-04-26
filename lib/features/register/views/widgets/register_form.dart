import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_app/core/routing/routes.dart';
import 'package:social_media_app/core/utils/extensions.dart';
import 'package:social_media_app/core/utils/snack_bar.dart';
import 'package:social_media_app/core/utils/validator.dart';
import 'package:social_media_app/features/register/cubit/register_cubit.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailureState) {
          showSnackBar(state.message, Colors.red);
        } else if (state is RegisterSuccessState) {
          showSnackBar('Success', Colors.green);
        } else if (state is RegisterLoadingState) {
          showSnackBar('Loading', Colors.green);
        }
      },
      builder: (context, state) {
        return Form(
          key: context.read<RegisterCubit>().registerFormKey,
          child: Column(
            children: [
              AppTextFormField(
                  hintText: "Email",
                  keyBoardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_rounded,
                  controller: context.read<RegisterCubit>().email,
                  validator: (value) {
                    return Validator.validateEmail(value);
                  }),
              verticalSpace(24),
              AppTextFormField(
                hintText: "Password",
                secure: true,
                controller: context.read<RegisterCubit>().password,
                prefixIcon: FontAwesomeIcons.lock,
                suffixIcon: true,
                validator: (value) {
                  return Validator.validatePassword(value);
                },
              ),
              verticalSpace(48),
              AppButton(
                  title: 'Sign up ',
                  onTap: () {
                    context.read<RegisterCubit>().register();
                    // context.pushNamed(Routes.selectGenderView);
                  }),
              verticalSpace(124),
            ],
          ),
        );
      },
    );
  }
}
