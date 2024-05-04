import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../cubit/register_cubit.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return SizedBox(
          width: 140.w,
          height: 140.h,
          child: CircleAvatar(
            backgroundColor: AppColors.dark1,
            backgroundImage: context.read<RegisterCubit>().userImg == null
                ? const AssetImage(AppAssets.avatar)
                : FileImage(context.read<RegisterCubit>().userImg!)
                    as ImageProvider,
            child: Stack(
              children: [
                Positioned(
                  bottom: 3,
                  right: 3,
                  child: GestureDetector(
                    onTap: () async {
                      context.read<RegisterCubit>().getImageFromGallery();
                    },
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
      },
    );
  }
}
