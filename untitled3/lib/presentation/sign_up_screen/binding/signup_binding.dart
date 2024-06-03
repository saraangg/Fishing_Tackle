import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../controller/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<SignupController>(()=>SignupController());
  }
}