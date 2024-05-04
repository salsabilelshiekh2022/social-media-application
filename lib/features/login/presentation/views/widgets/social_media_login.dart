import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/utils/snack_bar.dart';
import 'package:social_media_app/features/login/presentation/cubit/login_cubit.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/spacing.dart';
import 'social_media_button.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SignInWithFaceBookLoadingState ||
            state is SignInWithGoogleLoadingState) {
          showSnackBar('Loading', Colors.green);
        } else if (state is SignInWithFaceBookFailureState) {
          showSnackBar(state.message, Colors.red);
          print(state.message);
        } else if (state is SignInWithFaceBookSuccessState ||
            state is SignInWithGoogleSuccessState) {
          showSnackBar('Success', Colors.green);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            SocialMediaButton(
              onTap: () {
                context.read<LoginCubit>().loginWithFaceBook();
              },
              title: 'Continue with Facebook',
              icon: AppAssets.facebookIcon,
            ),
            verticalSpace(16),
            SocialMediaButton(
              onTap: () {
                context.read<LoginCubit>().loginWithGoogle();
              },
              title: 'Continue with Google',
              icon: AppAssets.googleIcon,
            ),
            verticalSpace(16),
            SocialMediaButton(
              onTap: () {},
              title: 'Continue with Apple',
              icon: AppAssets.appleIcon,
            ),
            verticalSpace(34)
          ],
        );
      },
    );
  }
}
