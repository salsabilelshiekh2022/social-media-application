import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/routing/routes.dart';
import 'package:social_media_app/core/utils/extensions.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/have_account_or_not.dart';
import '../../../../../core/widgets/or_divider.dart';
import 'social_media_login.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(100),
            Image.asset(
              AppAssets.welcomeImage,
              width: 237.w,
              height: 200.h,
            ),
            verticalSpace(30),
            Text(
              'Let’s you in',
              style: AppTextStyle.font48whiteBold,
            ),
            verticalSpace(30),
            const SocialMediaLogin(),
            const OrDivider(
              text: 'or',
            ),
            verticalSpace(34),
            AppButton(
              title: 'Sign in with Password',
              onTap: () {
                context.pushNamed(Routes.loginPage);
              },
            ),
            verticalSpace(30),
            HaveAccountOrNot(
              haveAccountOrAlreadyHave: 'Don’t have an account? ',
              signUpOrSignIn: 'Sign Up',
              onTap: () {},
            ),
          ],
        ),
      ),
    ));
  }
}
