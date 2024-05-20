import 'package:e_commerce/core/utils/dimensions.dart';
import 'package:e_commerce/data/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../home_screen/controller/home_controller.dart';

class FavoritePage extends StatelessWidget {
  final homeController = Get.put(HomeController());

  FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Obx(
                  () => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Adjust the number of columns as needed
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: homeController.selectedFavorites.length,
                itemBuilder: (context, index) {
                  final selectedIndex =
                  homeController.selectedFavorites[index];
                  return Card(
                    child: Stack(
                      children: [
                        Image.asset(
                          Models().product[selectedIndex].image,
                          height: 200,width: 200,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              homeController
                                  .removeImageFromStorage(selectedIndex);
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 135,
                          child: IconButton(
                            icon: Icon(Icons.shopping_bag, color: Colors.red),
                            onPressed: () {
                              // Your logic for shopping bag action
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
