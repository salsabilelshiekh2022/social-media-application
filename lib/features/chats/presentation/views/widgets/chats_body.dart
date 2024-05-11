import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/features/chats/presentation/cubit/chats_cubit.dart';
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
              BlocBuilder<ChatsCubit, ChatsState>(
                builder: (context, state) {
                  if (state is GetAllUsersLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetAllUsersSuccessState) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          return ChatItem(
                            user: state.users[index],
                          );
                        });
                  } else {
                    return const Center(
                      child: Text('No Data Available!'),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
