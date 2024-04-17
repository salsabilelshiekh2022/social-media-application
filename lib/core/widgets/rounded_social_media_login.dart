import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/spacing.dart';
import 'round_social_media_button.dart';

class RoundedSocialMediaLogin extends StatelessWidget {
  const RoundedSocialMediaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundSocialMediaButton(
          icon: AppAssets.facebookIcon,
          onTap: () {},
        ),
        horizontalSpace(20),
        RoundSocialMediaButton(
          icon: AppAssets.googleIcon,
          onTap: () {},
        ),
        horizontalSpace(20),
        RoundSocialMediaButton(
          icon: AppAssets.appleIcon,
          onTap: () {},
        ),
      ],
    );
  }
}
