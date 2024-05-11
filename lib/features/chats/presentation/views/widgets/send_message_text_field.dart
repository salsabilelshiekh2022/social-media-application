import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../login/data/models/user_model.dart';
import '../../cubit/chats_cubit.dart';

class SendMessageTextField extends StatefulWidget {
  const SendMessageTextField({super.key, required this.user});

  final UserModel user;

  @override
  State<SendMessageTextField> createState() => _SendMessageTextFieldState();
}

class _SendMessageTextFieldState extends State<SendMessageTextField> {
  @override
  void initState() {
    super.initState();
    context.read<ChatsCubit>().textMessage.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    context.read<ChatsCubit>().textMessage.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      // Trigger a rebuild when the text changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        final cubit = context.read<ChatsCubit>();

        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.dark3,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              child: Row(children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.image_outlined,
                      color: AppColors.white,
                    ),
                  ),
                ),
                //horizontalSpace(16),
                Expanded(
                  child: TextFormField(
                    maxLines: 10,
                    minLines: 1,
                    controller: cubit.textMessage,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Start a message',
                      hintStyle: AppTextStyle.font18whiteMedium
                          .copyWith(color: AppColors.grey500),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {
                        if (cubit.textMessage.text.isNotEmpty) {
                          cubit.sendMessage(
                            receiverId: widget.user.uId,
                          );
                          cubit.textMessage.clear();
                          cubit.scrollDown();
                        }
                      },
                      icon: cubit.textMessage.text.isEmpty
                          ? const Icon(Icons.graphic_eq_rounded,
                              color: AppColors.deepPurple)
                          : const Icon(
                              Icons.send,
                              color: AppColors.blue,
                            )),
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
