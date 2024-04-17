import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget(
      {super.key,
      this.active = false,
      required this.gender,
      required this.icon,
      this.onTap});
  final bool? active;
  final String gender;
  final String icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: ShapeDecoration(
          color: active == false ? AppColors.dark3 : null,
          gradient: active!
              ? const LinearGradient(
                  begin: Alignment(-0.96, 0.28),
                  end: Alignment(0.96, -0.28),
                  colors: [
                    Color(0xFFFF8294),
                    Color(0xFFFF4D67),
                  ],
                )
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            verticalSpace(20),
            Text(
              gender,
              style: AppTextStyle.font24whiteBold,
            )
          ],
        ),
      ),
    );
  }
}
