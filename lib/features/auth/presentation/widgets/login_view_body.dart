import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_hub/constants.dart';
import 'package:hotel_hub/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:hotel_hub/features/auth/presentation/views/register_view.dart';

import '../../../../core/utils/app_router.dart';
import 'button.dart';
import 'custom_textFormField.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login to your Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Enter your information below',
              style: TextStyle(
                color: KSubtitleColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            CustomTextFormField(
              controller: emailController,
              labelText: 'Email',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              //  prefixIcon: Icon(Icons.email),
            ),
            SizedBox(
              height: 22,
            ),
            CustomTextFormField(
              controller: passwordController,
              hintText: 'Enter your password',
              labelText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: FontAwesomeIcons.eyeSlash,
              // prefixIcon: Icon(Icons.lock),
            ),
            SizedBox(
              height: 32,
            ),
            Button(title: 'Login', onPressed: () {}),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    //context.go(AppRouter.KRegisterView);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegisterView(),));
                  },
                  child: const Text(
                    'Register Now',
                    style: TextStyle(color: KPrimaryColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
