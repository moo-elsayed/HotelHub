import 'package:flutter/material.dart';
import 'package:hotel_hub/features/onboarding/data/models/onboarding_object.dart';

import 'onboarding_indicator.dart';

class OnboardingText extends StatelessWidget {
  const OnboardingText(
      {super.key, required this.onboardingObject});

  final OnboardingObject onboardingObject;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .21,
      padding: EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OnboardingIndicator(),
          SizedBox(
            height: 20,
          ),
          Text(
            onboardingObject.title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            onboardingObject.subtitle,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff9D9EA6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
