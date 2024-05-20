import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'otp_controller.dart';
import 'otpfield_controller.dart';

class OtpfieldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpfieldController>(() =>OtpfieldController() );
  }
}