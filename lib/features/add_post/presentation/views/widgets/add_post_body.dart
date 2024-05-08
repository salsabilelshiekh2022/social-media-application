import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';

class AddPostBody extends StatelessWidget {
  const AddPostBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 16.h,
          bottom: 24.h,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundImage: const NetworkImage(
                      'https://i.pinimg.com/564x/50/f9/fd/50f9fd233d898e8bf57b75fbedf15315.jpg'),
                ),
                horizontalSpace(12),
                Expanded(
                    child: TextField(
                  enabled: true,
                  autofocus: true,
                  cursorColor: AppColors.mainColor,
                  decoration: const InputDecoration.collapsed(
                    hintText: 'What\'s on your mind?',
                    hintStyle: TextStyle(color: AppColors.grey500),
                    border: InputBorder.none,
                  ),
                  maxLines:
                      MediaQuery.of(context).viewInsets.bottom > 0 ? 15 : 15,
                ))
              ],
            ),
            const Spacer(),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.photo_camera_rounded,
                        color: AppColors.mainColor,
                      ),
                    ),
                    horizontalSpace(16),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.image_rounded,
                        color: AppColors.mainColor,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.mainColor,
                          minimumSize: Size(90.w, 40.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Post',
                          style: AppTextStyle.font16whiteSemiBold,
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
