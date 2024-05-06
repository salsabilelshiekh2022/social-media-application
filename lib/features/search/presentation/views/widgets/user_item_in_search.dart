import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';

class UserItemInSearch extends StatelessWidget {
  const UserItemInSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.h,
        left: 16.w,
        right: 12.w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: const NetworkImage(
                'https://i.pinimg.com/564x/e5/3b/f3/e53bf3d0aa612a5e36bbafdbbe2db074.jpg'),
          ),
          horizontalSpace(16.h),
          SizedBox(
            width: 345.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sali',
                      style: AppTextStyle.font18WhiteBold,
                    ),
                    Text(
                      '@saliEslam',
                      style: AppTextStyle.font16Grey500Regular,
                    ),
                    Text(
                      '✨ بنكبر و بتكبر الأحلام ',
                      style: AppTextStyle.font16whiteRegular,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 130.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Center(
                      child: Text(
                        'Follow',
                        style: AppTextStyle.font16whiteSemiBold.copyWith(
                          color: AppColors.dark1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
