import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/spacing.dart';

class HaveAccountOrNot extends StatelessWidget {
  const HaveAccountOrNot(
      {super.key,
      required this.haveAccountOrAlreadyHave,
      required this.signUpOrSignIn,
      this.onTap});
  final String haveAccountOrAlreadyHave;
  final String signUpOrSignIn;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            haveAccountOrAlreadyHave,
            style: AppTextStyle.font14whiteRegular,
          ),
          horizontalSpace(4),
          Text(signUpOrSignIn,
              style: AppTextStyle.font14whiteRegular.copyWith(
                color: AppColors.mainColor,
              )),
        ],
      ),
    );
  }
}
