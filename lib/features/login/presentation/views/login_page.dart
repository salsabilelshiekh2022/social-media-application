import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/database/network/auth.dart';
import 'package:social_media_app/features/login/data/repos/login_repo_impl.dart';
import '../cubit/login_cubit.dart';
import 'widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(LoginRepoImpl(auth: Auth())),
        child: const LoginBody(),
      ),
    );
  }
}
