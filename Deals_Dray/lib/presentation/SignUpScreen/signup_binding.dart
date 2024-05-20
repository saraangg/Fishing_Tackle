import 'package:deals_dray/presentation/SignUpScreen/signup_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class Signupbinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut< SignUpController>(() =>  SignUpController());
  }

}