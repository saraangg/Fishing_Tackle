import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'assignment_controller.dart';

class AssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignmentControllers>(() =>AssignmentControllers() );
  }
}