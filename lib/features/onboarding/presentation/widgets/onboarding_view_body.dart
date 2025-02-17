import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_hub/features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';
import 'package:hotel_hub/features/onboarding/presentation/widgets/onboarding_view_content.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OnboardingCubit>(context);
    return PageView.builder(
      controller: cubit.pageController,
      itemCount: cubit.list.length,
      onPageChanged: (value) {
        cubit.changeIndex(value: value);
      },
      itemBuilder: (context, index) {
        return OnboardingViewContent(
          onboardingObject: cubit.list[index],
        );
      },
    );
  }
}
