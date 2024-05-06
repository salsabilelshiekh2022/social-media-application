import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'chat_item.dart';

import '../../../../../core/utils/spacing.dart';
import 'chats_app_bar.dart';

class ChatsBody extends StatelessWidget {
  const ChatsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 15.h, bottom: 50.h),
          child: Column(
            children: [
              const ChatsAppBar(),
              const Divider(),
              verticalSpace(18),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const ChatItem();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
