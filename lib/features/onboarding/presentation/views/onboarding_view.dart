import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_hub/features/onBoarding/presentation/widgets/onboarding_view_body.dart';
import 'package:hotel_hub/features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        // appBar: AppBar(
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarColor: Colors.transparent
        //   ),
        // ),
        body: OnboardingViewBody(),
      ),
    );
  }
}
