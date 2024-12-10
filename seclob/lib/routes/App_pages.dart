import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:seclob/presentation/home2.dart';
import 'package:seclob/presentation/home_screen/page/home_page.dart';

import '../presentation/home_screen/binding/home_binding.dart';
import 'App_routes.dart';

class AppPages {
  static var Lists = [
  GetPage(
  name: AppRoutes.Home,
  page: () => Home2(),
  //binding: HomeBinding(),
  ),
];
}