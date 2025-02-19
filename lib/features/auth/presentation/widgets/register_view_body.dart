import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_hub/core/utils/app_router.dart';
import 'package:hotel_hub/features/auth/presentation/views/login_view.dart';
import '../../../../constants.dart';
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
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(right: 20,left: 20,top: MediaQuery.of(context).size.height * .11),
        child: SingleChildScrollView(
          child: Column(
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
                // prefixIcon: Icon(Icons.lock),
              ),
              SizedBox(height: 32),
              Button(title: 'Login', onPressed: () {}),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      //context.go(AppRouter.KLoginView);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
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
    );
  }
}
