import 'package:flutter/material.dart';
import 'package:hotel_hub/features/onboarding/data/models/onboarding_object.dart';

class OnboardingViewContent extends StatelessWidget {
  const OnboardingViewContent({super.key, required this.onboardingObject});

  final OnboardingObject onboardingObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(onboardingObject.image),
        ),
        Text(onboardingObject.title),
        Text(onboardingObject.subtitle),
      ],
    );
  }
}
