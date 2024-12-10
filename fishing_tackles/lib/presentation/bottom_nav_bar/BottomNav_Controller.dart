import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BottomnavController extends GetxController {
  var selectedBottomNavItem = 0.obs; // To track the selected bottom nav item
  var currentIndex = 0.obs;
  var selectedIndex = 0.obs;
}