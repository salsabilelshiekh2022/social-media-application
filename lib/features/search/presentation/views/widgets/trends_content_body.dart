import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../data/models/for_you_model.dart';
import 'for_you_item.dart';

class TrendsContentBody extends StatelessWidget {
  const TrendsContentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(16),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Text(
            'Trends',
            style: AppTextStyle.font24whiteBold,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: forYouDummyData.length,
            itemBuilder: (context, index) => ForYouItem(
              model: forYouDummyData[index],
              index: index,
            ),
          ),
        )
      ],
    );
  }
}
