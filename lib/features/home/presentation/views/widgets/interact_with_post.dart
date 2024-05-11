import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_app/features/home/presentation/cubit/home_cubit.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../add_post/data/models/post_model.dart';
import 'special_icon_button.dart';

class InteractWithPost extends StatelessWidget {
  const InteractWithPost({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return SizedBox(
          width: 348.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SpecialIconButton(
                  onPressed: () {},
                  icon: FontAwesomeIcons.comment,
                  text: '10',
                  color: AppColors.grey500),
              SpecialIconButton(
                  onPressed: () {},
                  icon: FontAwesomeIcons.retweet,
                  text: ' 20',
                  color: AppColors.grey500),
              SpecialIconButton(
                onPressed: () {
                  if (post.likes!.contains(AppConstants.userId)) {
                    cubit.dislikePost(postId: post.id!);
                  } else {
                    cubit.likePost(postId: post.id!);
                  }
                },
                icon: post.likes!.contains(AppConstants.userId)
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                size: 20.sp,
                text: post.likes!.length.toString(),
                textColor: post.likes!.contains(AppConstants.userId)
                    ? AppColors.pink
                    : AppColors.grey500,
                color: post.likes!.contains(AppConstants.userId)
                    ? AppColors.pink
                    : AppColors.grey500,
              ),
              SpecialIconButton(
                  onPressed: () {
                    if (post.bookMarks!.contains(AppConstants.userId)) {
                      cubit.unSavePost(postId: post.id!);
                    } else {
                      cubit.savePost(postId: post.id!);
                    }
                  },
                  icon: post.bookMarks!.contains(AppConstants.userId)
                      ? Icons.bookmark
                      : Icons.bookmark_outline_rounded,
                  size: 20.sp,
                  color: post.bookMarks!.contains(AppConstants.userId)
                      ? AppColors.blue
                      : AppColors.grey500),
              SpecialIconButton(
                  onPressed: () {},
                  icon: Icons.share_rounded,
                  color: AppColors.grey500),
            ],
          ),
        );
      },
    );
  }
}
