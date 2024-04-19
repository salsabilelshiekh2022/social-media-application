import 'package:flutter/material.dart';

import 'widgets/fill_your_profile_body.dart';

class FillYourProfileView extends StatelessWidget {
  const FillYourProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FillYourProfileBody(),
    );
  }
}
