import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ui/presentation/assignment/assignment_binding.dart';
import 'package:ui/presentation/assignment/assignment_page.dart';
import 'package:ui/presentation/homework/homewrk_binding.dart';
import 'package:ui/presentation/homework/homewrk_page.dart';
import 'package:ui/presentation/pay%20fee/pay%20fee_page.dart';

import '../presentation/bottomnav/bottom_nav.dart';
import '../presentation/bottomnav/bottomnav_binding.dart';
import '../presentation/home_screen/home_binding.dart';
import '../presentation/home_screen/home_page.dart';
import '../presentation/pay fee/pay fee_binding.dart';
import '../presentation/profile/profile_binding.dart';
import '../presentation/profile/profile_page.dart';
import '../presentation/welcome_screen/welcome_binding.dart';
import '../presentation/welcome_screen/welcome_page.dart';
import 'app_routes.dart';

class AppPages{
  static var List = [
    GetPage(
      name: AppRoutes.Welcome,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
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
      name: AppRoutes.Assignment,
      page: () =>Assignment(),
      binding: AssignmentBinding(),
    ),
    GetPage(
      name: AppRoutes.HomeWork,
      page: () =>HomeWrk(),
      binding: HomeWrkBinding(),
    ),
    GetPage(
      name: AppRoutes.PayFee,
      page: () =>FeePage(),
      binding: FeeBinding(),
    ),
    GetPage(
      name: AppRoutes.Profile,
      page: () =>ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}