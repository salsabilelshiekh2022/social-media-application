import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, this.onTap, required this.title, this.icon});
  final void Function()? onTap;
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 28.sp),
          horizontalSpace(16),
          Text(title,
              style: AppTextStyle.font24whiteBold.copyWith(fontSize: 22.sp)),
        ],
      ),
    );
  }
}
