import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';

class OnBoardingModel {
  final String image;
  final String title;

  OnBoardingModel({required this.image, required this.title});
}

List<OnBoardingModel> onBoardingDummyData(BuildContext context) => [
      OnBoardingModel(
        image: AppAssets.onboarding1,
        title: 'Watch interesting videos from around the world',
      ),
      OnBoardingModel(
        image: AppAssets.onboarding2,
        title: 'Find your friends and play together on social media',
      ),
      OnBoardingModel(
        image: AppAssets.onboarding3,
        title: 'Let\'s have fun with your friends & zuzu right now!',
      ),
    ];
