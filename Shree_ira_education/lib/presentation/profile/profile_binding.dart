import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shree_ira_education/presentation/profile/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProfileController >(() => ProfileController ());
  }

}