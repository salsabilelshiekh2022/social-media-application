import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/constants.dart';

class ChatsAppBar extends StatelessWidget {
  const ChatsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: NetworkImage(AppConstants.userImage),
          ),
          GestureDetector(
              onTap: () {},
              child: Container(
                width: 300.w,
                height: 45.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey700, width: 0.5),
                  color: AppColors.dark3,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 0.h, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Search Direct Messages',
                        style: TextStyle(color: AppColors.grey500),
                      ),
                      Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 18.sp,
                        color: AppColors.grey500,
                      ),
                    ],
                  ),
                ),
              )),
          Icon(Icons.settings_rounded, size: 24.sp),
        ],
      ),
    );
  }
}
