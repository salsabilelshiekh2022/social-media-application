import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/add_post/data/repos/add_post_repo_impl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';

import '../cubit/add_post_cubit.dart';
import 'widgets/add_post_body.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Post',
        ),
        backgroundColor: AppColors.dark1,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.close_rounded),
          color: AppColors.white,
        ),
      ),
      body: BlocProvider(
        create: (context) => AddPostCubit(addPostRepo: AddPostRepoImpl()),
        child: const AddPostBody(),
      ),
    );
  }
}
