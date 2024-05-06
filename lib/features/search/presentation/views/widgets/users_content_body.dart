import 'package:flutter/material.dart';

import 'user_item_in_search.dart';

class UsersContantBody extends StatelessWidget {
  const UsersContantBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => const UserItemInSearch());
  }
}
