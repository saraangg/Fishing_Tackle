import 'package:e_commerce/presentation/sign_in_screen/controller/login_controller.dart';
import 'package:e_commerce/presentation/sign_up_screen/controller/signup_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() =>LoginController() );
  }
}
