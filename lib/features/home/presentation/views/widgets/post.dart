import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../add_post/data/models/post_model.dart';
import 'header_of_post.dart';
import 'interact_with_post.dart';
import 'post_body.dart';

class Post extends StatelessWidget {
  const Post({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(post.profilePhoto ?? ''),
          radius: 24.r,
        ),
        horizontalSpace(8),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HeaderOfPost(post: post),
          verticalSpace(4),
          PostBody(
            post: post,
          ),
          verticalSpace(8),
          const InteractWithPost()
        ]),
      ],
    );
  }
}
