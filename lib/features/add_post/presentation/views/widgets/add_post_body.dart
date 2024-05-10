import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/features/add_post/presentation/cubit/add_post_cubit.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/spacing.dart';

class AddPostBody extends StatelessWidget {
  const AddPostBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 16.h,
          bottom: 24.h,
        ),
        child: BlocBuilder<AddPostCubit, AddPostState>(
          builder: (context, state) {
            final cubit = context.read<AddPostCubit>();
            return Column(
              children: [
                Expanded(
                    child: ListView(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 24.r,
                        backgroundImage: NetworkImage(AppConstants.userImage),
                      ),
                      horizontalSpace(12),
                      const Expanded(
                          child: TextField(
                        enabled: true,
                        autofocus: true,
                        cursorColor: AppColors.mainColor,
                        decoration: InputDecoration.collapsed(
                          hintText: 'What\'s on your mind?',
                          hintStyle: TextStyle(color: AppColors.grey500),
                          border: InputBorder.none,
                        ),
                        maxLines: 15,
                        minLines: 1,
                      ))
                    ],
                  ),
                  verticalSpace(12),
                  cubit.postImg != null
                      ? Padding(
                          padding: EdgeInsets.only(left: 55.w),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.file(
                                  cubit.postImg!,
                                  height: 440.h,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 12.h,
                                right: 12.w,
                                child: GestureDetector(
                                  onTap: () {
                                    cubit.removeImage();
                                  },
                                  child: Container(
                                    width: 30.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.dark2.withOpacity(0.9),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.close_rounded,
                                      color: AppColors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ])),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            cubit.getImageFromCamera();
                          },
                          child: const Icon(
                            Icons.photo_camera_rounded,
                            color: AppColors.mainColor,
                          ),
                        ),
                        horizontalSpace(16),
                        GestureDetector(
                          onTap: () {
                            cubit.getImageFromGallery();
                          },
                          child: const Icon(
                            Icons.image_rounded,
                            color: AppColors.mainColor,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.mainColor,
                              minimumSize: Size(90.w, 40.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Post',
                              style: AppTextStyle.font16whiteSemiBold,
                            )),
                      ],
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
