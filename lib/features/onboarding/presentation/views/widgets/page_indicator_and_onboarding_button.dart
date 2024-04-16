import 'package:flutter/material.dart';
import 'package:social_media_app/features/onboarding/presentation/views/widgets/custom_smooth_page_indicator.dart';

import '../../../../../core/utils/spacing.dart';
import 'onboarding_button.dart';

class PageIndicatorAndOnboardingButton extends StatelessWidget {
  final PageController controller;
  final int index;
  const PageIndicatorAndOnboardingButton(
      {super.key, required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(64),
        CustomSmoothPageIndicator(
          controller: controller,
        ),
        verticalSpace(60),
        OnboardingButton(
          index: index,
          controller: controller,
        ),
        verticalSpace(48),
      ],
    );
  }
}
