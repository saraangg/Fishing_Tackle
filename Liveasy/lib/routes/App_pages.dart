import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:liveasy/presentation/otp_field_screen/binding/otpfield_binding.dart';
import 'package:liveasy/presentation/otp_field_screen/page/otpfield_page.dart';
import 'package:liveasy/presentation/phone_number_screen/binding/number_binding.dart';
import 'package:liveasy/presentation/phone_number_screen/page/number_page.dart';
import 'package:liveasy/presentation/profile/binding/profile_binding.dart';
import 'package:liveasy/presentation/profile/page/profile_page.dart';
import 'package:liveasy/presentation/welcome_screen/binding/welcome_binding.dart';
import 'package:liveasy/presentation/welcome_screen/page/welcome_page.dart';

import '../presentation/splash_screen/binding/splash_binding.dart';
import '../presentation/splash_screen/page/splash_page.dart';
import 'App_routes.dart';

class AppPages {
  static var Lists = [
    GetPage(
      name: AppRoutes.SplashScreen,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.Welcome,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
        name: AppRoutes.Number,
        page:() => NumberPage(),
      binding: NumberBinding(),
    ),
    GetPage(
      name: AppRoutes.Otp,
      page:() => OtpfieldPage(),
      binding: OtpfieldBinding(),
    ),
    GetPage(
      name: AppRoutes.Profile,
      page:() => ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}