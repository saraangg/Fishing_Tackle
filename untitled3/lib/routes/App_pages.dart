import 'package:get/get.dart';
import 'package:untitled3/presentation/home_screen/binding/home_binding.dart';
import 'package:untitled3/presentation/home_screen/page/home_page.dart';
import 'package:untitled3/presentation/sign_up_screen/binding/signup_binding.dart';
import 'package:untitled3/presentation/sign_up_screen/page/signup_page.dart';
import 'package:untitled3/presentation/splash_screen/binding/splash_binding.dart';
import 'package:untitled3/presentation/splash_screen/page/splash_page.dart';
import 'package:untitled3/routes/App_routes.dart';

import '../presentation/sign_in_screen/binding/login_binding.dart';
import '../presentation/sign_in_screen/page/login_page.dart';
import '../presentation/verification_screen/binding/otp_binding.dart';
import '../presentation/verification_screen/page/otp_page.dart';

class AppPages{
  static var Lists=[
    GetPage(
      name: AppRoutes.Signup,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.OTP,
      page: () => OtpPage(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AppRoutes.Splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),

  ];
}