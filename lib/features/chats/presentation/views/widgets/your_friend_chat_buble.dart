import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class YourFriendChatBubble extends StatelessWidget {
  const YourFriendChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.dark3,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
              bottomLeft: Radius.circular(4.r),
              bottomRight: Radius.circular(24.r)),
        ),
        child:
            Text('How are you doing? ', style: AppTextStyle.font18whiteMedium),
      ),
    );
  }
}
