import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';

class UserImageAndCover extends StatelessWidget {
  const UserImageAndCover({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: Stack(
        children: [
          Image.network(
            'https://i.pinimg.com/564x/1a/8c/89/1a8c89e60292847c9b8c55cc933a9b3a.jpg',
            height: 140.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
              left: 12.w,
              top: 90.h,
              right: 12.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.dark1,
                    radius: 52.r,
                    child: CircleAvatar(
                      radius: 48.r,
                      backgroundImage: NetworkImage(AppConstants.userImage),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 130.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: AppColors.grey600,
                            )),
                        child: Center(
                            child: Text(
                          'Edit Profile',
                          style: AppTextStyle.font18whiteSemiBold,
                        )),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
