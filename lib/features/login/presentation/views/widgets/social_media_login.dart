import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/spacing.dart';
import 'social_media_button.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaButton(
          onTap: () {},
          title: 'Continue with Facebook',
          icon: AppAssets.facebookIcon,
        ),
        verticalSpace(16),
        SocialMediaButton(
          onTap: () {},
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
  }
}
