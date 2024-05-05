import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/detect_language.dart';
import '../../../../../core/utils/spacing.dart';

class PostBody extends StatelessWidget {
  PostBody({super.key});

  final String text1 =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ';
  final bool isArabic = detectLanguage(
          string:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ') ==
      'ar';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 338.w,
          child: Text(
            text1,
            textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          ),
        ),
        verticalSpace(4),
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.network(
            'https://i.pinimg.com/736x/11/e8/56/11e8565c7eeb66d8be5c741762623da8.jpg',
            width: 348.w,
            height: 320.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
