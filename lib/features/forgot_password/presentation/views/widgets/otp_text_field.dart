import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/theme/app_colors.dart';
import 'package:social_media_app/core/theme/app_text_styles.dart';

class OTPTextField extends StatelessWidget {
  const OTPTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      contentPadding: EdgeInsets.zero,
      alignment: Alignment.center,
      autoFocus: true,
      numberOfFields: 4,
      borderColor: AppColors.dark3,
      fieldWidth: 83.w,
      fieldHeight: 61.h,
      fillColor: AppColors.dark2,
      borderRadius: BorderRadius.circular(12.r),
      showFieldAsBox: true,
      enabledBorderColor: AppColors.dark3,
      focusedBorderColor: AppColors.mainColor,
      cursorColor: AppColors.white,
      textStyle: AppTextStyle.font24whiteBold,
      filled: true,
      onCodeChanged: (String code) {},
      onSubmit: (String verificationCode) {},
    );
  }
}
