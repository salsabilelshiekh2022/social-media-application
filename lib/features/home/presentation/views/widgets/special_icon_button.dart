import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/spacing.dart';

class SpecialIconButton extends StatelessWidget {
  const SpecialIconButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      this.size = 16,
      this.text = ''});
  final void Function()? onPressed;
  final IconData icon;
  final double size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Icon(
            icon,
            color: AppColors.grey500,
            size: size,
          ),
        ),
        horizontalSpace(3),
        Text(text, style: TextStyle(color: AppColors.grey500, fontSize: 14.sp)),
      ],
    );
  }
}
