import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/routing/routes.dart';
import 'package:social_media_app/core/utils/extensions.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 24.w, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
              radius: 32.r,
              backgroundImage: const NetworkImage(
                  'https://i.pinimg.com/736x/e5/cc/06/e5cc06fdbd18a461b560b8417dbc57bb.jpg')),
          horizontalSpace(4),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.chatView);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Rana',
                      style: AppTextStyle.font18whiteMedium,
                    ),
                    horizontalSpace(4),
                    Text(
                      '@Cool_tazz . 20h',
                      style: AppTextStyle.font16Grey500Regular.copyWith(
                        fontSize: 18.sp,
                      ),
                    )
                  ],
                ),
                verticalSpace(3),
                SizedBox(
                  height: 50.h,
                  width: 285.w,
                  child: Text(
                    maxLines: 2,
                    'Hello. How are you?',
                    style: AppTextStyle.font16Grey500Regular.copyWith(
                      fontSize: 18.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
