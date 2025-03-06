import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel_hub/constants.dart';
import 'package:hotel_hub/features/auth/data/models/login_input.dart';
import 'package:hotel_hub/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:hotel_hub/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:hotel_hub/features/auth/presentation/views/register_view.dart';
import 'package:hotel_hub/features/home/presentation/views/home_view.dart';
import 'package:hotel_hub/shared_preferences_manager.dart';
import '../../../../core/utils/widgets/awesome_dialog.dart';
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
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginFailure) {
          if (state.errorMessage != 'empty field!') {
            showAwesomeDialog(
              context: context,
              description: state.errorMessage,
              dialogType: DialogType.error,
            );
          }
          autoValidateMode = AutovalidateMode.always;
          isLoading = false;
          setState(() {});
        } else if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          isLoading = false;
          log('success');
          SharedPreferencesManager.setAuthToken(state.loginOutput.token);
          SharedPreferencesManager.setExpiresOn(
              state.loginOutput.expiresOn.toString());
          SharedPreferencesManager.setEmail(state.loginOutput.email);
          SharedPreferencesManager.setUsername(state.loginOutput.username);
          log(state.loginOutput.token);
          log(state.loginOutput.expiresOn.toString());
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeView(),
          ));
        }
      },
      builder: (context, state) => SafeArea(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                Button(
                  title: 'Login',
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).login(
                      loginInput: LoginInput(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                  },
                  isLoading: isLoading,
                ),
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => RegisterView()));
                      },
                      child: const Text(
                        'Register Now',
                        style: TextStyle(color: KPrimaryColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
