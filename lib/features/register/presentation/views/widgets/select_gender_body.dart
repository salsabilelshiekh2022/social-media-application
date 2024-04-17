import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/spacing.dart';
import 'gender_widget.dart';
import 'header.dart';
import 'skip_button_and_continue_button.dart';

class SelectGenderBody extends StatelessWidget {
  const SelectGenderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          verticalSpace(30),
          const Header(
            title: 'Tell Us About Your Self',
            subTitle:
                'Choose your identity & help us to find accurate content for you.',
          ),
          verticalSpace(90),
          GenderWidget(
            gender: 'Male',
            icon: AppAssets.maleIcon,
            active: true,
            onTap: () {},
          ),
          verticalSpace(36),
          GenderWidget(
            gender: 'Female',
            icon: AppAssets.femaleIcon,
            active: false,
            onTap: () {},
          ),
          verticalSpace(58),
          SkipButtonAndContinueButton(
            skipMethod: () {},
            continueMethod: () {},
          )
        ],
      ),
    ));
  }
}
