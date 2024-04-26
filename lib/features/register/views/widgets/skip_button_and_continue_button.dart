import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class SkipButtonAndContinueButton extends StatelessWidget {
  const SkipButtonAndContinueButton(
      {super.key, this.skipMethod, this.continueMethod});
  final void Function()? skipMethod;
  final void Function()? continueMethod;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: skipMethod,
          child: Container(
            width: 184.w,
            height: 58.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: AppColors.dark3,
            ),
            child: Center(
              child: Text(
                'Skip',
                style: AppTextStyle.font16whiteBold,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: continueMethod,
          child: Container(
            width: 184.w,
            height: 58.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: AppColors.mainColor,
            ),
            child: Center(
              child: Text(
                'Continue',
                style: AppTextStyle.font16whiteBold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
