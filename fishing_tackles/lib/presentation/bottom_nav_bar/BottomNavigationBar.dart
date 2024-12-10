import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Cart/Cart.dart';
import '../Favourite/Favourite.dart';
import '../Order/Order.dart';
import '../home_screen/page/HomePage.dart';
import 'BottomNav_Controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  final BottomnavController controller = Get.put(BottomnavController());

  final List<Widget> pages = [
    Homepage(),
    //Favoritepage(),
    Order(),
    //Favoritepage(), // Replace this with the correct page for "Chat" if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedBottomNavItem.value]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(Cart());
        },
        shape: CircleBorder(),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.shopping_cart,
          color: Color(0xFFEB1C23),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
            () => AnimatedBottomNavigationBar(
          icons: [
            Icons.home,
            //Icons.favorite,
            Icons.shopping_bag,
            //Icons.notifications,
          ],
          activeIndex: controller.selectedBottomNavItem.value,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          backgroundColor: Colors.white,
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          onTap: (index) {
            controller.selectedBottomNavItem.value = index;
          },
        ),
      ),
    );
  }
}
