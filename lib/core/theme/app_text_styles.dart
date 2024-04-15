import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'font_weight_helper.dart';

abstract class AppTextStyle {
  static TextStyle font40whiteBold = TextStyle(
    fontSize: 40.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16whiteBold = TextStyle(
    fontSize: 16.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font48whiteBold = TextStyle(
    fontSize: 48.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16whiteSemiBold = TextStyle(
    fontSize: 16.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font18whiteSemiBold = TextStyle(
    fontSize: 18.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font14whiteRegular = TextStyle(
    fontSize: 14.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14whiteSemiBold = TextStyle(
    fontSize: 14.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font14Grey500Regular = TextStyle(
    fontSize: 14.sp,
    color: AppColors.grey500,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font16MainColorSemiBold = TextStyle(
    fontSize: 16.sp,
    color: AppColors.mainColor,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font24whiteBold = TextStyle(
    fontSize: 24.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font18whiteMedium = TextStyle(
    fontSize: 18.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font32whiteBold = TextStyle(
    fontSize: 32.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16whiteRegular = TextStyle(
    fontSize: 16.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font24mainColorBold = TextStyle(
    fontSize: 24.sp,
    color: AppColors.mainColor,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14Grey300Medium = TextStyle(
    fontSize: 14.sp,
    color: AppColors.grey300,
    fontWeight: FontWeightHelper.medium,
  );
}
