import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/features/add_post/data/models/post_model.dart';

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
                child: Post(
                  post: PostModel(
                      id: '1',
                      dateTime: '20 h',
                      fullName: 'Rana',
                      nickName: 'Cool_tazz',
                      postImage:
                          'https://i.pinimg.com/736x/11/e8/56/11e8565c7eeb66d8be5c741762623da8.jpg',
                      postText:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                      profilePhoto:
                          'https://i.pinimg.com/736x/11/e8/56/11e8565c7eeb66d8be5c741762623da8.jpg',
                      userId: ''),
                ),
              )),
    );
  }
}
