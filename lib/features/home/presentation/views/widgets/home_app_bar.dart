import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_app/core/theme/app_colors.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/constants.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: CircleAvatar(
              radius: 20.r,
              backgroundImage: NetworkImage(AppConstants.userImage),
            ),
          ),
          SvgPicture.asset(
            AppAssets.logo,
            width: 36.w,
            colorFilter:
                const ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn),
          ),
          Icon(FontAwesomeIcons.bell, size: 22.sp),
        ],
      ),
    );
  }
}
