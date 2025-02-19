import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_hub/constants.dart';
import 'package:hotel_hub/features/onboarding/presentation/manager/onboarding_cubit/onboarding_states.dart';

import '../manager/onboarding_cubit/onboarding_cubit.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    var onboardingCubit = BlocProvider.of<OnboardingCubit>(context);
    return BlocBuilder<OnboardingCubit, OnboardingStates>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onboardingCubit.list.length,
          (index) {
            return Container(
              margin: EdgeInsets.only(right: index == 2 ? 0 : 5),
              height: 4,
              width: index == onboardingCubit.currentIndex ? 50 : 10,
              decoration: ShapeDecoration(
                color: index == onboardingCubit.currentIndex
                    ? KPrimaryColor
                    : Color(0xff9D9EA6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            );
          },
        ),
      ),
    );
  }
}
