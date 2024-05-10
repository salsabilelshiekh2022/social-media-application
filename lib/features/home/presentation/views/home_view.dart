import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/home_repo_impl.dart';
import '../cubit/home_cubit.dart';
import 'widgets/drawer_body.dart';
import 'widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.black,
        child: DrawerBody(),
      ),
      body: BlocProvider(
        create: (context) => HomeCubit(homeRepo: HomeRepoImpl()),
        child: const HomeBody(),
      ),
    );
  }
}
