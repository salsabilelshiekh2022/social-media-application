import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/utils/extensions.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/spacing.dart';
import 'fill_your_profile_form.dart';

class FillYourProfileBody extends StatelessWidget {
  const FillYourProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(children: [
          verticalSpace(30),
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
                'Fill your profile',
                style: AppTextStyle.font24whiteBold,
              ),
            ],
          ),
          verticalSpace(30),
          const FillYourProfileForm()
        ]),
      )),
    );
  }
}
