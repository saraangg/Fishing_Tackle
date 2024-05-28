import 'package:gemini/api.dart';
import 'package:gemini/presentation/home/Text_with_image.dart';
import 'package:gemini/presentation/home/binding.dart';
import 'package:gemini/presentation/login/login_binding.dart';
import 'package:gemini/presentation/login/login_page.dart';
import 'package:gemini/presentation/sign%20up/signup_binding.dart';
import 'package:gemini/presentation/sign%20up/signup_page.dart';
import 'package:gemini/presentation/welcome/welcome_binding.dart';
import 'package:gemini/presentation/welcome/welcome_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app_routes.dart';

class AppPages {
  static var Lists=[
  GetPage(
  name: AppRoutes.LoginPage,
  page: () => LoginPage(),
  binding: LoginBinding(),
  ),
    GetPage(
      name: AppRoutes.Welcome,
      page: () =>WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.TextWithImage,
      page: () =>TextWithImage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.SignUp,
      page: () =>SignUpPage(),
      binding: SignupBinding(),
    ),
  ];
}