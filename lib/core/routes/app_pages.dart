import 'package:furniture_app/core/routes/app_routes.dart';
import 'package:furniture_app/views/Main_navigation.dart';
import 'package:furniture_app/views/auth/forgot_password.dart';
import 'package:furniture_app/views/auth/otp_screen.dart';
import 'package:furniture_app/views/auth/reset_password_screen.dart';
import 'package:furniture_app/views/auth/signin_screen.dart';
import 'package:furniture_app/views/auth/signup_screen.dart';
import 'package:furniture_app/views/splash/intro_page.dart';
import 'package:furniture_app/views/splash/splash_widget.dart';
import 'package:furniture_app/widgets/categories_widget.dart';
import 'package:furniture_app/widgets/filter_screen_widget.dart';
import 'package:furniture_app/widgets/search_screen_widget.dart';
import 'package:get/get.dart';

class AppRouting {
  static final route = RouteView.values.map((e) {
    switch (e) {
      case RouteView.home:
        return GetPage(
          name: "/",
          page: () => MainNavigation(),
          transition: Transition.noTransition,
        );
      case RouteView.onboarding:
        return GetPage(
          name: "/${e.name}",
          page: () => OnboardingScreen(),
          // binding: (),
        );
      case RouteView.splash:
        return GetPage(
          name: "/${e.name}",
          page: () => SplashWidget(),
          // binding: (),
        );
      case RouteView.signIn:
        return GetPage(
          name: "/${e.name}",
          page: () => SigninScreen(),
          // binding: (),
        );
      case RouteView.signUp:
        return GetPage(
          name: "/${e.name}",
          page: () => SignupScreen(),
          // binding: (),
        );
      case RouteView.forgotPassword:
        return GetPage(
          name: "/${e.name}",
          page: () => ForgotPassword(),
          // binding: (),
        );
      case RouteView.otp:
        return GetPage(
          name: "/${e.name}",
          page: () => OtpScreen(),
          // binding: (),
        );
      case RouteView.resetPassword:
        return GetPage(
          name: "/${e.name}",
          page: () => ResetPasswordScreen(),
          // binding: (),
        );
      case RouteView.searchScreen:
        return GetPage(
          name: "/${e.name}",
          page: () => SearchScreenWidget(),
          // binding: (),
        );
      case RouteView.filterScreen:
        return GetPage(
          name: "/${e.name}",
          page: () => FilterScreen(),
          // binding: (),
        );
      case RouteView.categoryWidget:
        return GetPage(
          name: "/${e.name}",
          page: () => CategoriesWidget(),
          // binding: (),
        );
    }
  }).toList();
}
