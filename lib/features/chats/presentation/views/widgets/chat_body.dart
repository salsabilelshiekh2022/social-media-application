import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/constants.dart';
import '../../../data/models/message_model.dart';
import '../../cubit/chats_cubit.dart';

import '../../../../login/data/models/user_model.dart';
import 'send_message_text_field.dart';
import 'your_chat_buble.dart';
import 'your_friend_chat_buble.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.only(
            bottom: 16.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Column(
            children: [
              StreamBuilder<List<MessageModel?>>(
                stream: context
                    .read<ChatsCubit>()
                    .getMessages(receiverId: user.uId),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    final messages = snapshot.data!;
                    if (messages.isEmpty) {
                      return const Expanded(
                        child: Center(
                          child: Text('No Data Available!'),
                        ),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                          reverse: true,
                          controller:
                              context.read<ChatsCubit>().scrollController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            if (messages[index]!.senderId ==
                                AppConstants.userId) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: YourChatBubble(
                                  message: messages[index]!,
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: YourFriendChatBubble(
                                  message: messages[index]!,
                                ),
                              );
                            }
                          }),
                    );
                  }
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }),
              ),
              SendMessageTextField(
                user: user,
              ),
            ],
          )),
    );
  }
}
