import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hotel_hub/features/auth/presentation/views/register_view.dart';
import 'package:hotel_hub/features/onBoarding/presentation/views/onboarding_view.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(
  //     widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  runApp(const MyApp());
  // Future.delayed(Duration(seconds: 2), () {
  //   FlutterNativeSplash.remove();
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingView()
    );
  }
}
