import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/theme/app_colors.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: controller, // PageController
        count: 3,
        effect: ExpandingDotsEffect(
            dotWidth: 10.w,
            dotHeight: 8.h,
            radius: 10.r,
            spacing: 10.w,
            activeDotColor: AppColors.mainColor,
            dotColor: AppColors.dark3),
        // your preferred effect
        onDotClicked: (index) {});
  }
}
