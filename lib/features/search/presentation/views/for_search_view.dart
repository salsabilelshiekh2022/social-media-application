import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/theme/app_colors.dart';
import 'package:social_media_app/core/utils/extensions.dart';
import 'package:social_media_app/core/utils/spacing.dart';

import '../../../../core/theme/app_text_styles.dart';

class ForSearchView extends StatelessWidget {
  const ForSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForSearchBody(),
    );
  }
}

class ForSearchBody extends StatelessWidget {
  const ForSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                  ),
                ),
                horizontalSpace(24),
                const Expanded(
                    child: TextField(
                  cursorColor: AppColors.mainColor,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Search', border: InputBorder.none),
                ))
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              children: [
                Text('Try searching for people, topics or keywords',
                    style: AppTextStyle.font14Grey500Medium.copyWith(
                        fontSize: 18.sp, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
