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
      this.text = '',
      required this.color,
      this.textColor = AppColors.grey500});
  final void Function()? onPressed;
  final IconData icon;
  final Color color;
  final double size;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Icon(
            icon,
            color: color,
            size: size,
          ),
        ),
        horizontalSpace(3),
        Text(text, style: TextStyle(color: textColor, fontSize: 14.sp)),
      ],
    );
  }
}
