import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'special_icon_button.dart';

class InteractWithPost extends StatelessWidget {
  const InteractWithPost({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 348.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SpecialIconButton(
              onPressed: () {}, icon: FontAwesomeIcons.comment, text: '10'),
          SpecialIconButton(
              onPressed: () {}, icon: FontAwesomeIcons.retweet, text: ' 20'),
          SpecialIconButton(
            onPressed: () {},
            icon: Icons.favorite_border_rounded,
            size: 20.sp,
            text: '30',
          ),
          SpecialIconButton(
              onPressed: () {},
              icon: Icons.bookmark_outline_rounded,
              size: 20.sp),
          SpecialIconButton(onPressed: () {}, icon: Icons.share_rounded),
        ],
      ),
    );
  }
}
