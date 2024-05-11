import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'your_friend_chat_buble.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 16.h,
          left: 16.w,
          right: 16.w,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, indedx) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: YourFriendChatBubble(),
                    );
                  }),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.dark3,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.image_outlined,
                        color: AppColors.white,
                      ),
                    ),
                    //horizontalSpace(16),
                    Expanded(
                      child: Text('Start a message',
                          style: AppTextStyle.font18whiteMedium
                              .copyWith(color: AppColors.grey500)),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.graphic_eq_rounded,
                            color: AppColors.deepPurple,
                          )),
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
