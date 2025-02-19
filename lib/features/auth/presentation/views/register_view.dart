import 'package:flutter/material.dart';
import '../../../../shared_preferences_manager.dart';
import '../widgets/register_view_body.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  void initState() {
    SharedPreferencesManager.setFirstTime(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterViewBody(),
    );
  }
}
