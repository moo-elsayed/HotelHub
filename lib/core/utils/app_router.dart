import 'package:go_router/go_router.dart';
import 'package:hotel_hub/features/auth/presentation/views/login_view.dart';
import 'package:hotel_hub/features/auth/presentation/views/register_view.dart';
import 'package:hotel_hub/features/onBoarding/presentation/views/onboarding_view.dart';

class AppRouter {
  static const KLoginView = '/Login';
  static const KRegisterView = '/Register';

  static GoRouter createRouter(bool isFirstTime) {
    return GoRouter(
      initialLocation: isFirstTime ? '/Onboarding' : KLoginView,
      routes: [
        GoRoute(
          path: '/Onboarding',
          builder: (context, state) => OnboardingView(),
        ),
        GoRoute(
          path: KRegisterView,
          builder: (context, state) => RegisterView(),
        ),
        GoRoute(
          path: KLoginView,
          builder: (context, state) => LoginView(),
        ),
      ],
    );
  }
}
