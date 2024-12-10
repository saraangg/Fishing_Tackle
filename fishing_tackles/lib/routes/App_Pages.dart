import 'package:fishing_tackles/presentation/Cart/Cart.dart';
import 'package:fishing_tackles/presentation/home_screen/page/HomePage.dart';
import 'package:fishing_tackles/presentation/splash_screen/Splash.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../presentation/bottom_nav_bar/BottomNavigationBar.dart';
import 'App_Routes.dart';

class AppPages {
  static var Lists = [
    GetPage(
      name: AppRoutes.Cart,
      page: () => Cart(),
    ),
    GetPage(
      name: AppRoutes.BottomNav,
      page: () => CustomBottomNavBar(),
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => Homepage(),
    ),
    GetPage(
      name: AppRoutes.Splash,
      page: () => SplashPage(),
    ),
  ];
}
