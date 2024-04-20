import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/routing/routes.dart';
import 'package:social_media_app/core/utils/app_assets.dart';
import 'package:social_media_app/core/utils/extensions.dart';
import 'package:social_media_app/core/utils/spacing.dart';
import 'package:social_media_app/core/widgets/app_button.dart';
import 'package:social_media_app/features/forgot_password/presentation/views/widgets/forgot_password_method.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ForgotPasswordMethodBody extends StatelessWidget {
  const ForgotPasswordMethodBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding:
          EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h, bottom: 48.h),
      child: Column(
        children: [
          Row(
            children: [
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
              horizontalSpace(16),
              Text('Forgot Password', style: AppTextStyle.font24whiteBold),
            ],
          ),
          verticalSpace(35),
          Image.asset(
            AppAssets.forgotPass,
            width: 250.w,
            height: 244.h,
          ),
          verticalSpace(35),
          Text(
            'Select which contact details should we use to reset your password',
            style: AppTextStyle.font18whiteMedium,
          ),
          verticalSpace(24),
          const ForgotPasswordMethod(),
          const Spacer(),
          AppButton(
              title: 'Continue',
              onTap: () {
                context.pushReplacementNamed(Routes.forgotPasswordOtpView);
              })
        ],
      ),
    ));
  }
}
