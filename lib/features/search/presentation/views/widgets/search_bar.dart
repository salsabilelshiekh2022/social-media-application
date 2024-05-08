import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../core/theme/app_colors.dart';
import '../for_search_view.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

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
          GestureDetector(
              onTap: () {
                PersistentNavBarNavigator.pushDynamicScreen(
                  context,
                  screen: MaterialPageRoute(
                      builder: (context) => const ForSearchView()),
                  withNavBar: false,
                );
              },
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
                        'Search',
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
