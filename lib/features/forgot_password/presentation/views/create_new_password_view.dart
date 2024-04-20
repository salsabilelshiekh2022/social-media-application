import 'package:flutter/material.dart';

import 'widgets/create_new_password_body.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CreateNewPasswordBody(),
    );
  }
}
