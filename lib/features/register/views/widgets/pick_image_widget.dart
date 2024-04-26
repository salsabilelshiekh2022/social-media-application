import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_assets.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.w,
      height: 140.h,
      child: CircleAvatar(
        backgroundColor: AppColors.dark1,
        backgroundImage: const AssetImage(AppAssets.avatar),
        child: Stack(
          children: [
            Positioned(
              bottom: 3,
              right: 3,
              child: GestureDetector(
                onTap: () async {},
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: Icon(
                    Icons.edit_rounded,
                    color: Colors.black,
                    size: 22.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
