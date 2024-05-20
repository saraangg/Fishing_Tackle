import 'package:e_commerce/presentation/sign_up_screen/controller/signup_controller.dart';// Corrected import statement
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
