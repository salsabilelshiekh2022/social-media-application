import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/network/auth.dart';
import '../../data/repos/register_repo_impl.dart';
import '../cubit/register_cubit.dart';
import 'widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(RegisterRepoImpl(auth: Auth())),
        child: const RegisterBody(),
      ),
    );
  }
}
