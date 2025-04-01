import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_hub/features/auth/domain/auth_repo.dart';
import 'package:hotel_hub/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:hotel_hub/features/home/presentation/views/home_view.dart';
import 'package:hotel_hub/shared_preferences_manager.dart';
import 'package:hotel_hub/simple_bloc_observer.dart';
import 'core/utils/helperFunctions.dart';
import 'features/auth/presentation/views/login_view.dart';
import 'features/onBoarding/presentation/views/onboarding_view.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  final results = await Future.wait([
    SharedPreferencesManager.getFirstTime(),
    checkLoginStatus(),
  ]);

  final bool isFirstTime = results[0];
  final bool loginStatus = results[1];

  log("isFirstTime: $isFirstTime");
  log("loginStatus: $loginStatus");

  runApp(MyApp(
    isFirstTime: isFirstTime,
    loginStatus: loginStatus,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key, required this.isFirstTime, required this.loginStatus});

  final bool isFirstTime;

  final bool loginStatus;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepo()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isFirstTime
            ? OnboardingView()
            : loginStatus
                ? HomeView()
                : LoginView(),
      ),
    );
  }
}
