import 'package:flutter/material.dart';
import 'package:hotel_hub/features/auth/presentation/views/login_view.dart';

import '../../../../shared_preferences_manager.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome 😁'),
            ElevatedButton(
              onPressed: () async {
                await SharedPreferencesManager.clearUserData();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginView(),
                  ),
                );
              },
              child: Text('LogOut'),
            )
          ],
        ),
      ),
    );
  }
}
