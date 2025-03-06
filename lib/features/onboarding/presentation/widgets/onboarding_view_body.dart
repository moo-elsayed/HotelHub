import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_hub/features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';
import 'package:hotel_hub/features/onboarding/presentation/manager/onboarding_cubit/onboarding_states.dart';
import 'package:hotel_hub/features/onboarding/presentation/widgets/onboarding_view_content.dart';

import '../../../auth/presentation/views/login_view.dart';
import 'buttons.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var onboardingCubit = BlocProvider.of<OnboardingCubit>(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .85,
          child: PageView.builder(
            controller: pageController,
            itemCount: onboardingCubit.list.length,
            onPageChanged: (value) {
              onboardingCubit.changeIndex(value: value);
            },
            itemBuilder: (context, index) {
              return OnboardingViewContent(
                onboardingObject: onboardingCubit.list[index],
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
            child: onboardingCubit.currentIndex != 2
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonSkip(
                        onPressed: () {
                          //context.go(AppRouter.KLoginView);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginView()));
                        },
                      ),
                      ButtonNext(
                        title: 'Next',
                        onPressed: () {
                          int currentIndex = onboardingCubit.next();
                          pageController.animateToPage(currentIndex,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.linear);
                        },
                      ),
                    ],
                  )
                : ButtonNext(
                    title: 'Get Started',
                    onPressed: () {
                      //context.go(AppRouter.KLoginView);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginView()));
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
