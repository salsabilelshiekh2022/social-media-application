import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/spacing.dart';
import '../../../login/data/models/user_model.dart';
import 'widgets/chat_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.dark1,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back_rounded),
            ),
          ],
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundImage: NetworkImage(
                  user.profilePhoto ?? 'https://i.pravatar.cc/300'),
            ),
            horizontalSpace(16),
            Text(
              user.fullName!,
              style: AppTextStyle.font18WhiteBold,
            ),
          ],
        ),
      ),
      body: const ChatBody(),
    );
  }
}
