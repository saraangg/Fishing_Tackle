
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class SplashController extends GetxController {
  // box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    _init();
  }
Future<void> _init() async {
  await Future.delayed(
    Duration(seconds: 4),
  );
 Get.offNamed('/bottomnav');
}
}
