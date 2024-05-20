import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:ui/presentation/pay%20fee/pay%20fee_controller.dart';

class FeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeeController>(() =>FeeController() );
  }
}