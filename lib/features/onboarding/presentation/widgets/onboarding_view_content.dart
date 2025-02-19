import 'package:flutter/material.dart';
import 'package:hotel_hub/features/onboarding/data/models/onboarding_object.dart';
import 'onboarding_text.dart';

class OnboardingViewContent extends StatelessWidget {
  const OnboardingViewContent(
      {super.key, required this.onboardingObject});

  final OnboardingObject onboardingObject;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
          image: AssetImage(
            onboardingObject.image,
          ),
        ),
        OnboardingText(
          onboardingObject: onboardingObject,
        ),
      ],
    );
  }
}
