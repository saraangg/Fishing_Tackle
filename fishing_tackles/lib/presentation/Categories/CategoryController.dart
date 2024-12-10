import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/category_models.dart';

class CategoryController extends GetxController {
  final isLoading = true.obs; // Observable for loading state
  final CategoryModel categoryModel = CategoryModel();

  @override
  void onInit() {
    super.onInit();
    // Simulate a network delay to fetch data
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false; // Set loading to false after data is fetched
    });
  }
}