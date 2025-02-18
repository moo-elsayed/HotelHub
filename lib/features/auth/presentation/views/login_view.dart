import 'package:flutter/material.dart';
import 'package:hotel_hub/features/auth/presentation/widgets/login_view_body.dart';
import 'package:hotel_hub/shared_preferences_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    SharedPreferencesManager.setFirstTime(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(),
    );
  }
}
