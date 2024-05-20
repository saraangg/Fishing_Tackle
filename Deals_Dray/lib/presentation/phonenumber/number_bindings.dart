

import 'package:deals_dray/presentation/phonenumber/number_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class PhoneNumberbinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PhoneNumberController>(() =>PhoneNumberController());
  }

}