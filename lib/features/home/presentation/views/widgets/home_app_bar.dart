import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_assets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: const NetworkImage(
                'https://i.pinimg.com/564x/e5/3b/f3/e53bf3d0aa612a5e36bbafdbbe2db074.jpg'),
          ),
          SvgPicture.asset(
            AppAssets.logo,
            width: 36.w,
          ),
          Icon(FontAwesomeIcons.bell, size: 22.sp),
        ],
      ),
    );
  }
}
