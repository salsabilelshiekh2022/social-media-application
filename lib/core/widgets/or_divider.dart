import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/spacing.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1.h,
            color: AppColors.dark3,
          ),
        ),
        horizontalSpace(16),
        Text(
          text,
          style: AppTextStyle.font18whiteSemiBold,
        ),
        horizontalSpace(16),
        Expanded(
          child: Container(
            height: 1.h,
            color: AppColors.dark3,
          ),
        ),
      ],
    );
  }
}
