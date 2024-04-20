import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/spacing.dart';

class ForgotPasswordMethod extends StatelessWidget {
  const ForgotPasswordMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      width: double.infinity,
      height: 128.h,
      decoration: BoxDecoration(
        color: AppColors.dark2,
        borderRadius: BorderRadius.circular(32),
        border:
            Border.all(color: AppColors.mainColor.withOpacity(.7), width: 3),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: const Color(0x14FF4D67),
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: Center(child: SvgPicture.asset(AppAssets.mailIcon)),
          ),
          horizontalSpace(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'via Email:',
                style: AppTextStyle.font14Grey300Medium,
              ),
              verticalSpace(8),
              Text(
                'and***ley@yourdomain.com',
                style: AppTextStyle.font16whiteBold,
              )
            ],
          )
        ],
      ),
    );
  }
}
