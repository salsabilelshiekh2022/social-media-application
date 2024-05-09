import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/spacing.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.fullName,
            style: AppTextStyle.font24whiteBold.copyWith(
              fontSize: 28.sp,
            ),
          ),
          Text(
            '@${AppConstants.nickName}',
            style: AppTextStyle.font14Grey500Medium.copyWith(
              fontSize: 20.sp,
            ),
          ),
          verticalSpace(4),
          Text(
            '✨ بنكبر و بتكبر الأحلام',
            style: AppTextStyle.font18whiteMedium
                .copyWith(fontWeight: FontWeight.w400),
          ),
          verticalSpace(4),
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.locationDot,
                color: AppColors.grey500,
                size: 14,
              ),
              horizontalSpace(4),
              Text(
                'لندن الدور التاني',
                style:
                    AppTextStyle.font16Grey500Regular.copyWith(fontSize: 18.sp),
              ),
            ],
          ),
          verticalSpace(8),
          Row(
            children: [
              Text(
                '400',
                style: AppTextStyle.font24whiteBold.copyWith(fontSize: 20.sp),
              ),
              horizontalSpace(4),
              Text(
                'Following',
                style: AppTextStyle.font16Grey500Regular
                    .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
              horizontalSpace(24),
              Text(
                '450',
                style: AppTextStyle.font24whiteBold.copyWith(fontSize: 20.sp),
              ),
              horizontalSpace(4),
              Text(
                'Followers',
                style: AppTextStyle.font16Grey500Regular
                    .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}
