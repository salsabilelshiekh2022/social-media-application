import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';

class HeaderOfPost extends StatelessWidget {
  const HeaderOfPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Rana',
          style: AppTextStyle.font18WhiteBold,
        ),
        horizontalSpace(4),
        Text(
          '@Cool_tazz . 20h',
          style: AppTextStyle.font16Grey500Regular,
        ),
        horizontalSpace(155),
        const Icon(
          FontAwesomeIcons.ellipsisVertical,
          color: AppColors.grey500,
          size: 16,
        )
      ],
    );
  }
}
