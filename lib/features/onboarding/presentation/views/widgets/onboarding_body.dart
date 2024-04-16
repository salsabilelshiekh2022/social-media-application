import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../data/models/onboarding_model.dart';
import 'page_indicator_and_onboarding_button.dart';

class OnboardingBody extends StatelessWidget {
  OnboardingBody({super.key});

  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SizedBox(
          width: double.infinity,
          height: 926.h,
          child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: controller,
              itemCount: onBoardingDummyData(context).length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    verticalSpace(64),
                    Image.asset(
                      onBoardingDummyData(context)[index].image,
                      width: 300.w,
                      height: 340.h,
                    ),
                    verticalSpace(80),
                    Text(
                      textAlign: TextAlign.center,
                      onBoardingDummyData(context)[index].title,
                      style: AppTextStyle.font40whiteBold,
                    ),
                    PageIndicatorAndOnboardingButton(
                      controller: controller,
                      index: index,
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
