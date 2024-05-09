import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/spacing.dart';
import 'widgets/chat_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

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
              backgroundImage: const NetworkImage(
                  'https://i.pinimg.com/564x/e5/3b/f3/e53bf3d0aa612a5e36bbafdbbe2db074.jpg'),
            ),
            horizontalSpace(16),
            Text(
              'روان',
              style: AppTextStyle.font18WhiteBold,
            ),
          ],
        ),
      ),
      body: const ChatBody(),
    );
  }
}
