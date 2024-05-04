import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/network/auth.dart';
import '../../data/repos/register_repo_impl.dart';
import '../cubit/register_cubit.dart';
import 'widgets/fill_your_profile_body.dart';

class FillYourProfileView extends StatelessWidget {
  const FillYourProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(RegisterRepoImpl(auth: Auth())),
        child: const FillYourProfileBody(),
      ),
    );
  }
}
