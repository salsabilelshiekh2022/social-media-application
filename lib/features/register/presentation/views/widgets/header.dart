import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/spacing.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              title,
              style: AppTextStyle.font24whiteBold,
            ),
          ],
        ),
        verticalSpace(24),
        Text(
          subTitle,
          style: AppTextStyle.font18whiteMedium,
        )
      ],
    );
  }
}
