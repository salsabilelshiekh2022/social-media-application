import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/detect_language.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../add_post/data/models/post_model.dart';

class PostBody extends StatelessWidget {
  const PostBody({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final bool isArabic = detectLanguage(string: post.postText ?? '') == 'ar';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        post.postText == null
            ? const SizedBox()
            : SizedBox(
                width: 338.w,
                child: Text(
                  post.postText ?? '',
                  textDirection:
                      isArabic ? TextDirection.rtl : TextDirection.ltr,
                ),
              ),
        verticalSpace(4),
        post.postImage == ''
            ? const SizedBox()
            : ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  post.postImage ?? '',
                  width: 348.w,
                  height: 320.h,
                  fit: BoxFit.cover,
                ),
              ),
      ],
    );
  }
}
