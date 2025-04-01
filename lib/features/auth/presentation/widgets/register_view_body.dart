import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel_hub/features/auth/data/models/register_input.dart';
import 'package:hotel_hub/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:hotel_hub/features/auth/presentation/views/login_view.dart';
import 'package:hotel_hub/features/auth/presentation/widgets/password_requirement.dart';
import '../../../../constants.dart';
import '../../../../core/utils/helperFunctions.dart';
import '../../../../core/utils/widgets/awesome_dialog.dart';
import '../../../../shared_preferences_manager.dart';
import '../../../home/presentation/views/home_view.dart';
import '../manager/auth_cubit/auth_cubit.dart';
import 'button.dart';
import 'custom_textFormField.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  void dispose() {
    fNameController.dispose();
    lNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RegisterFailure) {
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
        } else if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          SharedPreferencesManager.setAuthToken(state.registerOutput.token);
          SharedPreferencesManager.setExpiresOn(
              state.registerOutput.expires.toString());
          SharedPreferencesManager.setEmail(emailController.text);
          SharedPreferencesManager.setUsername(userNameController.text);
          isLoading = false;
          log('success');
          log(state.registerOutput.token);
          log(state.registerOutput.expires.toString());
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeView(),
          ));
        }
      },
      builder: (context, state) => Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Enter your information below',
                    style: TextStyle(
                      color: KSubtitleColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 32),
                  CustomTextFormField(
                    controller: fNameController,
                    hintText: 'Enter your first name',
                    labelText: 'First Name',
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 22),
                  CustomTextFormField(
                    controller: lNameController,
                    hintText: 'Enter your last name',
                    labelText: 'Last Name',
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 22),
                  CustomTextFormField(
                    controller: userNameController,
                    hintText: 'Enter your user name',
                    labelText: 'User Name',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 22),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    //prefixIcon: Icon(Icons.email),
                  ),
                  SizedBox(height: 22),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: 'Enter your password',
                    labelText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: FontAwesomeIcons.eyeSlash,
                    onChanged: (String s) {
                      setState(() {});
                    },
                    // prefixIcon: Icon(Icons.lock),
                  ),
                  SizedBox(height: 22),
                  PasswordRequirementBuilder(
                    list: getPasswordRequirementList(
                      pass: passwordController.text,
                    ),
                  ),
                  SizedBox(height: 22),
                  Button(
                      title: 'Register',
                      onPressed: () {
                        if (!hasMinLength(passwordController.text) ||
                            !hasLowercase(passwordController.text) ||
                            !hasSpecialChar(passwordController.text) ||
                            !hasUppercase(passwordController.text)) {
                          showAwesomeDialog(
                              context: context,
                              description: 'unsuitable password');
                          return;
                        }
                        BlocProvider.of<AuthCubit>(context).register(
                          registerInput: RegisterInput(
                            firstName: fNameController.text,
                            lastName: lNameController.text,
                            username: userNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                      isLoading: isLoading),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          //context.go(AppRouter.KLoginView);
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginView(),
                          ));
                        },
                        child: const Text(
                          'Login',
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
      ),
    );
  }
}
