import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';

class HeaderOfDrawer extends StatelessWidget {
  const HeaderOfDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 28.r,
          backgroundImage: const NetworkImage(
              'https://i.pinimg.com/564x/e5/3b/f3/e53bf3d0aa612a5e36bbafdbbe2db074.jpg'),
        ),
        verticalSpace(12),
        Text('Rana',
            style: AppTextStyle.font24whiteBold.copyWith(fontSize: 22.sp)),
        Text('@cool_tazz',
            style: AppTextStyle.font16Grey500Regular.copyWith(fontSize: 18.sp)),
        verticalSpace(12),
        Row(
          children: [
            Text('401', style: AppTextStyle.font16whiteRegular),
            horizontalSpace(6),
            Text('Following', style: AppTextStyle.font16Grey500Regular),
            horizontalSpace(16),
            Text('50', style: AppTextStyle.font16whiteRegular),
            horizontalSpace(6),
            Text('Followers', style: AppTextStyle.font16Grey500Regular),
          ],
        ),
        verticalSpace(24),
        const Divider()
      ],
    );
  }
}
