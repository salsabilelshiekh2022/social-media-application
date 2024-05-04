import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/snack_bar.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/loading_button.dart';
import '../../cubit/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailureState) {
          showSnackBar(state.message, Colors.red);
        } else if (state is RegisterSuccessState) {
          showSnackBar('Your mail Create Successfully!', Colors.green);
          context.pushNamed(Routes.selectGenderView);
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
                  onChange: (value) {
                    context.read<RegisterCubit>().email = value;
                  },
                  validator: (value) {
                    return Validator.validateEmail(value);
                  }),
              verticalSpace(24),
              AppTextFormField(
                hintText: "Password",
                secure: true,
                onChange: (value) {
                  context.read<RegisterCubit>().password = value;
                },
                prefixIcon: FontAwesomeIcons.lock,
                suffixIcon: true,
                validator: (value) {
                  return Validator.validatePassword(value);
                },
              ),
              verticalSpace(48),
              state is RegisterLoadingState
                  ? const LoadingButton()
                  : AppButton(
                      title: 'Sign up ',
                      onTap: () {
                        context.read<RegisterCubit>().register();
                      }),
              verticalSpace(124),
            ],
          ),
        );
      },
    );
  }
}
