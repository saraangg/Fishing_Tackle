import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/models.dart';

class HomeController extends GetxController{
  RxList<bool> isFavoriteList =
      List.generate(Models().product.length, (index) => false).obs;
  RxList<int> selectedFavorites = <int>[].obs;
  final box = GetStorage();

  void toggleFavorite(int index) {
    isFavoriteList[index] = !isFavoriteList[index];

    if (isFavoriteList[index]) {
      selectedFavorites.add(index);
    } else {
      selectedFavorites.remove(index);
    }
    box.write('selectedFavorites', selectedFavorites);
  }

  void removeImageFromStorage(int index) {
    selectedFavorites.remove(index);
    box.write('selectedFavorites', selectedFavorites);
    isFavoriteList[index] = false;

    update();

    // Show a SnackBar to provide feedback
    Get.snackbar(
      'Image Removed',
      'The selected image has been removed from favorites.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey,
      colorText: Colors.white,
      duration: Duration(milliseconds: 800),
    );
  }


  @override
  void onInit() {
    // Read selectedFavorites from get_storage during initialization
    if (box.hasData('selectedFavorites')) {
      selectedFavorites.value = box.read('selectedFavorites').cast<int>();
      isFavoriteList.assignAll(
        List.generate(
          Models().product.length,
              (index) => selectedFavorites.contains(index),
        ),
      );
    }
    super.onInit();
  }
}