import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/utils/app_assets.dart';
import 'package:social_media_app/core/utils/extensions.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/congratulation_alert.dart';
import 'skip_button_and_continue_button.dart';

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

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.w,
      height: 140.h,
      child: CircleAvatar(
        backgroundColor: AppColors.dark1,
        backgroundImage: const AssetImage(AppAssets.avatar),
        child: Stack(
          children: [
            Positioned(
              bottom: 3,
              right: 3,
              child: GestureDetector(
                onTap: () async {},
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: Icon(
                    Icons.edit_rounded,
                    color: Colors.black,
                    size: 22.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FillYourProfileForm extends StatelessWidget {
  const FillYourProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        const PickImageWidget(),
        verticalSpace(24),
        const AppTextFormField(
          hintText: 'Full Name',
          prefixIcon: Icons.person,
        ),
        verticalSpace(24),
        const AppTextFormField(
          hintText: 'Nick Name',
          prefixIcon: Icons.person,
        ),
        verticalSpace(24),
        const AppTextFormField(
          hintText: 'Email',
          prefixIcon: Icons.email,
        ),
        verticalSpace(24),
        const AppTextFormField(
          hintText: 'Phone',
          prefixIcon: Icons.phone,
        ),
        verticalSpace(185),
        SkipButtonAndContinueButton(
          continueMethod: () {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => const CongratulationAlart());
          },
          skipMethod: () {},
        )
      ]),
    );
  }
}
