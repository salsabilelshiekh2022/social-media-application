import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/presentation/views/widgets/post.dart';

class PostsContentBody extends StatelessWidget {
  const PostsContentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 20,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: const Post(),
              )),
    );
  }
}
