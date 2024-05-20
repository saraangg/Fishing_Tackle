import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'bottomnav_controller.dart';

class BottomnavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomnavController>(() =>BottomnavController() );
  }
}