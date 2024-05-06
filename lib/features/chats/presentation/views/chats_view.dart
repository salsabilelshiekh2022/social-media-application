import 'package:flutter/material.dart';

import 'widgets/chats_body.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatsBody(),
    );
  }
}
