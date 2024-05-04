import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/login/presentation/cubit/login_cubit.dart';

import '../../../../core/database/network/auth.dart';
import '../../data/repos/login_repo_impl.dart';
import 'widgets/welcome_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(LoginRepoImpl(auth: Auth())),
        child: const WelcomeBody(),
      ),
    );
  }
}
