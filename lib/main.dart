import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:hotel_hub/features/auth/domain/repos/auth_repo_imp.dart';
import 'package:hotel_hub/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:hotel_hub/shared_preferences_manager.dart';
import 'package:hotel_hub/simple_bloc_observer.dart';

import 'core/utils/app_router.dart';
import 'features/auth/presentation/views/login_view.dart';
import 'features/onBoarding/presentation/views/onboarding_view.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  bool isFirstTime = await SharedPreferencesManager.getFirstTime();

  // FlutterNativeSplash.preserve(
  //     widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  runApp(MyApp(isFirstTime: isFirstTime));
  // Future.delayed(Duration(seconds: 2), () {
  //   FlutterNativeSplash.remove();
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirstTime});

  final bool isFirstTime;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepoImp(dio: Dio())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isFirstTime ? OnboardingView() : LoginView(),
      ),
    );
  }
}
