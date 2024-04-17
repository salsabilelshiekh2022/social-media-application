import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/utils/extensions.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/onboarding_model.dart';

class OnboardingButton extends StatelessWidget {
  final int index;
  final PageController controller;
  const OnboardingButton(
      {super.key, required this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        index == onBoardingDummyData(context).length - 1
            ? context.pushReplacementNamed(Routes.welcomeView)
            : controller.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn);
      },
      child: Container(
        width: double.infinity,
        height: 57.h,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: index != 2
            ? Center(
                child: Text(
                  'Next',
                  style: AppTextStyle.font16whiteBold,
                ),
              )
            : Center(
                child: Text(
                  'Get Started',
                  style: AppTextStyle.font16whiteBold,
                ),
              ),
      ),
    );
  }
}
