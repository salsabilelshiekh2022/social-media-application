import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/routing/routes.dart';
import 'package:social_media_app/core/utils/extensions.dart';
import 'package:social_media_app/features/login/data/models/user_model.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 24.w, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
              radius: 32.r,
              backgroundImage: NetworkImage(
                  user.profilePhoto ?? 'https://i.pravatar.cc/300')),
          horizontalSpace(8),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.chatView, arguments: {'user': user});
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      user.fullName!,
                      style: AppTextStyle.font18whiteMedium,
                    ),
                    horizontalSpace(4),
                    Text(
                      '${user.nickName ?? ''} . 20h',
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
