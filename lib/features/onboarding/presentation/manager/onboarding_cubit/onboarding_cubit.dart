import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_hub/features/auth/presentation/views/login_view.dart';
import 'package:hotel_hub/features/onboarding/data/models/onboarding_object.dart';
import 'package:hotel_hub/features/onboarding/presentation/manager/onboarding_cubit/onboarding_states.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit() : super(OnboardingInitial());
  final PageController pageController = PageController();
  int currentIndex = 0;
  late final List<OnboardingObject> list = _getList();

  List<OnboardingObject> _getList() {
    return [
      OnboardingObject(
        image: 'assets/images/onboardingImage1.jpg',
        title: 'Discover the best hotels',
        subtitle:
            'Find the hotels that suit you and enjoy an unforgettable stay experience.',
      ),
      OnboardingObject(
        image: 'assets/images/onboardingImage2.jpg',
        title: 'Book your room easily',
        subtitle:
            'Choose your accommodation date and pay securely. We take care of your comfort details.',
      ),
      OnboardingObject(
        image: 'assets/images/onboardingImage3.jpg',
        title: 'Enjoy a luxurious stay',
        subtitle:
            'Take advantage of our exclusive offers and premium services for an unparalleled accommodation experience.',
      ),
    ];
  }

  void changeIndex({required int value}) {
    currentIndex = value;
    emit(OnboardingChange());

    //log(currentIndex.toString());
  }

  void next() {
    pageController.animateToPage(++currentIndex,
        duration: Duration(milliseconds: 400), curve: Curves.linear);
    //log(currentIndex.toString());
  }

  void skip({required BuildContext context}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginView(),
      ),
    );
    emit(OnboardingSkip());
  }
}
