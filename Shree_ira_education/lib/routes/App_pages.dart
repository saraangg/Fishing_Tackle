import 'package:get/get_navigation/src/routes/get_route.dart';

import '../presentation/profile/Profile_page.dart';
import '../presentation/profile/profile_binding.dart';
import '../presentation/signin_screen/binding/login_binding.dart';
import '../presentation/signin_screen/page/login_page.dart';
import 'App_routes.dart';

class AppPages{
  static var Lists=[
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.Profile,
      page: () => ProfilePage(),
      binding:ProfileBinding(),
    ),
  ];
}