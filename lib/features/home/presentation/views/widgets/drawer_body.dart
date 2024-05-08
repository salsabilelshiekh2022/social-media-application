import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';
import 'drawer_header.dart';
import 'drawer_item.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 24.h),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const HeaderOfDrawer(),
            verticalSpace(48),
            const DrawerItem(
              icon: Icons.person_outline_rounded,
              title: 'Profile',
              onTap: null,
            ),
            verticalSpace(24),
            const DrawerItem(
              icon: Icons.people_alt_outlined,
              title: 'Communities',
              onTap: null,
            ),
            verticalSpace(24),
            const DrawerItem(
              icon: Icons.bookmark_outline_rounded,
              title: 'Bookmarks',
              onTap: null,
            ),
            verticalSpace(28),
            const DrawerItem(
              icon: Icons.featured_play_list_outlined,
              title: 'Lists',
              onTap: null,
            ),
            verticalSpace(28),
            const DrawerItem(
              icon: FontAwesomeIcons.microphoneAlt,
              title: 'Spaces',
              onTap: null,
            ),
            verticalSpace(28),
            const DrawerItem(
              icon: FontAwesomeIcons.moneyBillAlt,
              title: 'Monetization',
              onTap: null,
            ),
            verticalSpace(48),
            const Divider(),
            verticalSpace(48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Settings & Support',
                  style: AppTextStyle.font18WhiteBold,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 24,
                )
              ],
            ),
            verticalSpace(24),
            const Align(
                alignment: Alignment.topLeft,
                child: Icon(FontAwesomeIcons.moon))
          ],
        ),
      ),
    );
  }
}
