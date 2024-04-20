import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/utils/app_assets.dart';
import 'package:social_media_app/core/utils/extensions.dart';
import 'package:social_media_app/core/widgets/app_button.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';
import 'create_new_password_form.dart';

class CreateNewPasswordBody extends StatelessWidget {
  const CreateNewPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            top: 40.h,
            bottom: 48.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    'Create New Password',
                    style: AppTextStyle.font24whiteBold,
                  ),
                ],
              ),
              verticalSpace(68),
              Center(
                child: Image.asset(
                  AppAssets.createNewPass,
                  width: 360.w,
                  height: 257.h,
                ),
              ),
              verticalSpace(68),
              Text(
                'Create Your New Password',
                style: AppTextStyle.font18whiteMedium,
              ),
              const CreateNewPasswordForm(),
              verticalSpace(110),
              AppButton(title: 'Continue', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
