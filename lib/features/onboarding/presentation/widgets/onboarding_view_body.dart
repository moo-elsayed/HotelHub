import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_hub/features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';
import 'package:hotel_hub/features/onboarding/presentation/manager/onboarding_cubit/onboarding_states.dart';
import 'package:hotel_hub/features/onboarding/presentation/widgets/onboarding_view_content.dart';

import 'buttons.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OnboardingCubit>(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .85,
          child: PageView.builder(
            controller: cubit.pageController,
            itemCount: cubit.list.length,
            onPageChanged: (value) {
              cubit.changeIndex(value: value);
            },
            itemBuilder: (context, index) {
              return OnboardingViewContent(
                cubit: cubit,
                onboardingObject: cubit.list[index],
              );
            },
          ),
        ),
        BlocBuilder<OnboardingCubit, OnboardingStates>(
          builder: (context, state) => Container(
            height: MediaQuery.of(context).size.height * .15,
            color: Colors.white,
            width: double.infinity,
            padding: EdgeInsets.all(30),
            child: cubit.currentIndex != 2
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonSkip(
                        onPressed: () {
                          cubit.skip(context: context);
                        },
                      ),
                      ButtonNext(
                        title: 'Next',
                        onPressed: () {
                          cubit.next();
                        },
                      ),
                    ],
                  )
                : ButtonNext(
                    title: 'Get Started',
                    onPressed: () {
                      cubit.skip(context: context);
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
