import 'package:flutter/material.dart';
import 'widgets/select_gender_body.dart';

class SelectGenderView extends StatelessWidget {
  const SelectGenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SelectGenderBody(),
    );
  }
}
