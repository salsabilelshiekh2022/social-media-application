import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/utils/extensions.dart';
import 'package:social_media_app/core/widgets/app_button.dart';
import 'package:social_media_app/features/forgot_password/presentation/views/widgets/otp_text_field.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';

class ForgotPasswordOtpBody extends StatelessWidget {
  const ForgotPasswordOtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            top: 40.h,
            bottom: 48.h,
          ),
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
                  Text(
                    'Forgot Password',
                    style: AppTextStyle.font24whiteBold,
                  ),
                ],
              ),
              verticalSpace(97),
              Text(
                'Code has been send to +1 111 ******99',
                style: AppTextStyle.font18whiteMedium,
              ),
              verticalSpace(60),
              const OTPTextField(),
              verticalSpace(180),
              AppButton(title: 'Verify', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
