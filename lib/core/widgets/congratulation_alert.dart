import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/app_assets.dart';
import '../utils/spacing.dart';

class CongratulationAlart extends StatelessWidget {
  const CongratulationAlart({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.dark2,
      content: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 40.h, left: 32.w, right: 32.w, bottom: 32.h),
          child: Column(
            children: <Widget>[
              Image.asset(
                AppAssets.congratulation,
                width: 185.w,
                height: 180.h,
              ),
              verticalSpace(32),
              Text('Congratulations!', style: AppTextStyle.font24mainColorBold),
              verticalSpace(16),
              Text(
                textAlign: TextAlign.center,
                'Your account is ready to use. You will be redirected to home page in a few seconds',
                style: AppTextStyle.font14whiteRegular,
              ),
              verticalSpace(32),
              const CircularProgressIndicator(
                color: Color(0xffFF8395),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
