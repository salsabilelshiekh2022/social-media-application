import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../data/models/for_you_model.dart';

class ForYouItem extends StatelessWidget {
  const ForYouItem({super.key, required this.model, required this.index});
  final ForYouModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.h,
        left: 16.w,
        right: 12.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.trendingIn,
                style: AppTextStyle.font18whiteMedium
                    .copyWith(color: AppColors.grey500),
              ),
              verticalSpace(6),
              Text(model.trend, style: AppTextStyle.font18WhiteBold),
              verticalSpace(6),
              Text(
                model.numberOfPostsInTrend,
                style: AppTextStyle.font16Grey500Regular,
              ),
              forYouDummyData.length - 1 == index
                  ? verticalSpace(50)
                  : verticalSpace(0),
            ],
          ),
          const Icon(
            FontAwesomeIcons.ellipsisVertical,
            color: AppColors.grey500,
            size: 14,
          ),
        ],
      ),
    );
  }
}
