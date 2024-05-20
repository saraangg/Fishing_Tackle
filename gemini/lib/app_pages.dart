import 'package:gemini/api.dart';
import 'package:gemini/presentation/login_binding.dart';
import 'package:gemini/presentation/login_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app_routes.dart';

class AppPages {
  static var Lists=[
  GetPage(
  name: AppRoutes.LoginPage,
  page: () => LoginPage(),
  binding: LoginBinding(),
  ),
  ];
}