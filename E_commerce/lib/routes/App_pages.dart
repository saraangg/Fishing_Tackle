import 'package:e_commerce/presentation/favorite/favorite_binding.dart';
import 'package:e_commerce/presentation/favorite/favorite_page.dart';
import 'package:e_commerce/presentation/forgot_screen/binding/forgot_binding.dart';
import 'package:e_commerce/presentation/forgot_screen/forgot_page.dart';
import 'package:e_commerce/presentation/otp/otp_binding.dart';
import 'package:e_commerce/presentation/otp/otpfield.dart';
import 'package:e_commerce/presentation/otp/otpfield_binding.dart';
import 'package:e_commerce/presentation/profile/binding/profile_binding.dart';
import 'package:e_commerce/presentation/profile/profile_page.dart';
import 'package:e_commerce/presentation/sign_in_screen/binding/login_binding.dart';
import 'package:e_commerce/presentation/sign_in_screen/login_page.dart';
import 'package:e_commerce/presentation/sign_up_screen/binding/signup_binding.dart';
import 'package:e_commerce/presentation/sign_up_screen/signup_page.dart';
import 'package:e_commerce/presentation/splash_screen/binding/splash_binding.dart';
import 'package:e_commerce/presentation/splash_screen/splash_page.dart';
import 'package:e_commerce/presentation/welcome_screen/binding/welcome_binding.dart';
import 'package:e_commerce/presentation/welcome_screen/welcome_page.dart';
import 'package:e_commerce/routes/App_routes.dart';
import 'package:get/get.dart';

import '../presentation/bottomnav/bottom_nav.dart';
import '../presentation/bottomnav/bottomnav_binding.dart';
import '../presentation/home_screen/binding/home_binding.dart';
import '../presentation/home_screen/home_page.dart';
import '../presentation/my order/order_binding.dart';
import '../presentation/my order/order_page.dart';
import '../presentation/otp/otp_page.dart';

class AppPages {
  static var Lists=[
    GetPage(
        name: AppRoutes.SplashScreen,
        page: () => SplashPage(),
    binding: splashbinding(),
    ),
    GetPage(
      name: AppRoutes.Welcome,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),
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
      name: AppRoutes.Forgot,
      page: () => ForgotPage(),
      binding: ForgotBinding(),
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.Bottomnav,
      page: () =>Bottomnavigation(),
      binding: BottomnavBinding(),
    ),
    GetPage(
      name: AppRoutes.Favorite,
      page: () =>FavoritePage(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: AppRoutes.Profile,
      page: () =>ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.Otp,
      page: () =>OtpPage(),
      binding: OtpBinding(),
    ),GetPage(
      name: AppRoutes.Order,
      page: () =>OrderPage(),
      binding: OrderBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.Otpfield,
    //   page: () =>Otpfield(verificationid: '',),
    //   binding: OtpfieldBinding(),
    // ),
  ];
}