import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../add_post/data/models/post_model.dart';
import '../../cubit/home_cubit.dart';
import 'home_app_bar.dart';
import 'post.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
          child: Padding(
        padding: EdgeInsets.only(top: 15.h, bottom: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppBar(),
            const Divider(),
            verticalSpace(18),
           StreamBuilder<List<PostModel?>>(
                 
                  stream: context.read<HomeCubit>().getPosts(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState ==
                            ConnectionState.active) {
                      final posts = snapshot.data;
                      if (posts == null || posts.isEmpty) {
                        return const Center(
                          child: Text('No Data Available!'),
                        );
                      }
                      return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Post(
                                post: posts[index]!,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: posts.length);
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
               
            )
          ],
        ),
      )),
    );
  }
}
