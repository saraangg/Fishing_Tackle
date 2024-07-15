import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:liveasy/presentation/phone_number_screen/controller/number_controller.dart';

class NumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NumberController>(() =>NumberController() );
  }
}
