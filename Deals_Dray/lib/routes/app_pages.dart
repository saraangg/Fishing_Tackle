
import 'package:deals_dray/presentation/phonenumber/number_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../presentation/LoginScreen/login_binding.dart';
import '../presentation/LoginScreen/login_screen.dart';
import '../presentation/SignUpScreen/signup_binding.dart';
import '../presentation/SignUpScreen/signup_screen.dart';
import '../presentation/SplashScreen/splash_bindings.dart';
import '../presentation/SplashScreen/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static var Lists = [
    GetPage(
      name: AppRoutes.SplashScreen,
      page: () => SplashPage(),
      binding: Splashbinding(),
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginScreen(),
      binding: Loginbinding(),
    ),
    GetPage(
      name: AppRoutes.Signup,
      page: () =>SignUpScreen(),
      binding: Signupbinding(),
    ),
    GetPage(
      name: AppRoutes.PhoneNumber,
      page: () =>PhoneNumberView(),
     // binding: PhoneNumberbinding(),
    ),
  ];
}