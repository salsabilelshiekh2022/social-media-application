import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/spacing.dart';
import 'header_of_post.dart';
import 'interact_with_post.dart';
import 'post_body.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: const NetworkImage(
              'https://i.pinimg.com/736x/5a/35/fd/5a35fd5db690390510d094f830b97f62.jpg'),
          radius: 24.r,
        ),
        horizontalSpace(8),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const HeaderOfPost(),
          verticalSpace(4),
          PostBody(),
          verticalSpace(8),
          const InteractWithPost()
        ]),
      ],
    );
  }
}
