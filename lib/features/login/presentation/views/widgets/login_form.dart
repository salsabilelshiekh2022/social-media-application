import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_app/core/routing/routes.dart';
import 'package:social_media_app/core/utils/extensions.dart';
import 'package:social_media_app/core/utils/validator.dart';
import 'package:social_media_app/core/widgets/loading_button.dart';
import 'package:social_media_app/features/login/presentation/cubit/login_cubit.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/snack_bar.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SignInWithEmailAndPasswordFailureState) {
          showSnackBar(state.message, Colors.red);
        } else if (state is SignInWithEmailAndPasswordSuccessState) {
          showSnackBar('Success', Colors.green);
        }
      },
      builder: (context, state) {
        return Form(
          key: context.read<LoginCubit>().loginFormKey,
          child: Column(
            children: [
              AppTextFormField(
                hintText: "Email",
                keyBoardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_rounded,
                controller: context.read<LoginCubit>().email,
                validator: (value) {
                  return Validator.validateEmail(value);
                },
              ),
              verticalSpace(24),
              AppTextFormField(
                hintText: "Password",
                secure: true,
                prefixIcon: FontAwesomeIcons.lock,
                suffixIcon: true,
                controller: context.read<LoginCubit>().password,
                validator: (value) {
                  return Validator.validatePassword(value);
                },
              ),
              verticalSpace(48),
              state is SignInWithEmailAndPasswordLoadingState
                  ? const LoadingButton()
                  : AppButton(
                      title: 'Sign in ',
                      onTap: () {
                        context.read<LoginCubit>().loginWithEmailAndPassword();
                      }),
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
      },
    );
  }
}
