import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/utils/extensions.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/have_account_or_not.dart';
import '../../../../../core/widgets/or_divider.dart';
import '../../../../../core/widgets/rounded_social_media_login.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(40),
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 32.sp,
                  color: AppColors.white,
                ),
              ),
              verticalSpace(60),
              Text('Login to your Account',
                  style: AppTextStyle.font48whiteBold),
              verticalSpace(45),
              const LoginForm(),
              const OrDivider(text: 'or continue with'),
              verticalSpace(30),
              const RoundedSocialMediaLogin(),
              verticalSpace(45),
              HaveAccountOrNot(
                haveAccountOrAlreadyHave: 'Don’t have an account?',
                signUpOrSignIn: 'Sign up',
                onTap: () {
                  //context.pushNamed(Routes.signUpPage);
                },
              ),
              verticalSpace(48),
            ],
          ),
        ),
      ),
    );
  }
}
