import 'package:e_commerce/presentation/forgot_screen/controller/forgot_controller.dart';
import 'package:e_commerce/presentation/sign_in_screen/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotController>(() =>ForgotController() );
  }
}
