import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/chats/data/repos/chats_repo_impl.dart';

import '../cubit/chats_cubit.dart';
import 'widgets/chats_body.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        lazy: false,
        create: (context) =>
            ChatsCubit(chatRepo: ChatsRepoImpl())..getAllUsers(),
        child: const ChatsBody(),
      ),
    );
  }
}
