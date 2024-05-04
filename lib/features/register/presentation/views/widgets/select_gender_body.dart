import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/database/network/auth.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../data/repos/register_repo_impl.dart';
import '../../cubit/register_cubit.dart';
import 'gender_widget.dart';
import 'header.dart';
import 'skip_button_and_continue_button.dart';

class SelectGenderBody extends StatefulWidget {
  const SelectGenderBody({super.key});

  @override
  State<SelectGenderBody> createState() => _SelectGenderBodyState();
}

class _SelectGenderBodyState extends State<SelectGenderBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(RegisterRepoImpl(auth: Auth())),
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return Column(
              children: [
                verticalSpace(30),
                const Header(
                  title: 'Tell Us About Your Self',
                  subTitle:
                      'Choose your identity & help us to find accurate content for you.',
                ),
                verticalSpace(90),
                GenderWidget(
                  gender: 'Male',
                  icon: AppAssets.maleIcon,
                  active: context.read<RegisterCubit>().gender == 'Male'
                      ? true
                      : false,
                  onTap: () {
                    context.read<RegisterCubit>().gender = 'Male';
                    setState(() {});
                  },
                ),
                verticalSpace(36),
                GenderWidget(
                  gender: 'Female',
                  icon: AppAssets.femaleIcon,
                  active: context.read<RegisterCubit>().gender == 'Female'
                      ? true
                      : false,
                  onTap: () {
                    context.read<RegisterCubit>().gender = 'Female';
                    setState(() {});
                  },
                ),
                verticalSpace(58),
                SkipButtonAndContinueButton(
                  skipMethod: () {
                    context.pushNamed(Routes.fillYourProfileView);
                  },
                  continueMethod: () {
                    context.pushNamed(Routes.fillYourProfileView);
                  },
                )
              ],
            );
          },
        ),
      )),
    );
  }
}
